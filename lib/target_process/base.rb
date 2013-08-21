require 'active_support/inflector'

module  TargetProcess
  module Base

    def self.included(base)
      base.send(:include, InstanceMethods)
      base.extend(ClassMethods)
    end

    attr_reader :attributes, :changed_attributes

    module InstanceMethods
      def initialize(hash = {})
        @changed_attributes = hash
        @attributes = {}
      end

      def delete
        path = entity_path
        resp = TargetProcess.client.delete(path)
        true if resp.code == '200'
      end

      def save
        path = self.class.collection_path
        @changed_attributes.merge!(id: @attributes[:id]) if @attributes[:id]
        resp = TargetProcess.client.post(path, @changed_attributes)
        @changed_attributes = {}
        @attributes.merge!(resp)
        self
      end

      def ==(other)
        if self.class == other.class && all_attrs - other.all_attrs == []
          (all_attrs | other.all_attrs).all? do |key|
            send(key) == other.send(key)
          end
        else
          false
        end
      end

      def method_missing(name, *args)
        if respond_to_missing?(name)
          if name.to_s.match(/=\z/)
            key = name.to_s.delete('=').to_sym
            if @attributes[key] == args.first
              @changed_attributes.delete(key)
            else
              @changed_attributes[key] = args.first
            end
          else
            if @changed_attributes.has_key?(name)
              @changed_attributes[name]
            else
              @attributes[name]
            end
          end
        else
          super
        end
      end

      def respond_to_missing?(name, include_private = false)
        if name.to_s.match(/\A[a-z_]+\z/) && all_attrs.include?(name)
          true
        elsif name.to_s.match(/\A[a-z_]+=\z/) && name != :id=
          true
        else
          super
        end
      end

      def entity_path
        self.class.collection_path + @attributes[:id].to_s + '/'
      end

      def all_attrs
        @attributes.keys | @changed_attributes.keys
      end
    end

    module ClassMethods
      def where(params_str, options = {})
        options.merge!(where: params_str)
        all(options)
      end

      def all(options = {})
        path = collection_path
        TargetProcess.client.get(path, options)[:items].collect! do |hash|
          result = new
          result.attributes.merge!(hash)
          result
        end
      end

      def find(id, options = {})
        path = collection_path + id.to_s
        result = new
        result.attributes.merge!(TargetProcess.client.get(path, options))
        result
      end

      def collection_path
        to_s.demodulize.pluralize + '/'
      end

      def meta
        TargetProcess.client.get(collection_path + '/meta')
      end

      def has_many(name, klass = nil)
        klass ||= name.to_s.singularize.camelize
        define_method(name) do
          path = entity_path + name.to_s.camelize
          collection = TargetProcess.client.get(path)[:items].collect do |hash|
                         item = "TargetProcess::#{klass}".constantize.new
                         item.attributes.merge!(hash)
                         item
                       end
        end
      end

      def belongs_to (name, klass = nil)
        klass ||= name.to_s.camelize
        define_method(name) do
          if @attributes[name]
            "TargetProcess::#{klass}".constantize.find(@attributes[name][:id])
          else
            nil
          end
        end

        setter_name = (name.to_s + '=').to_sym
        define_method(setter_name) do |val|
          if val.class.to_s.demodulize == klass
            @changed_attributes.merge!(name => { id: val.id })
          end
        end
      end

    end
  end
end
