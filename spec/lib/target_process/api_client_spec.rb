require 'spec_helper'

describe TargetProcess::APIClient, vcr: true do

  before do
    TargetProcess.configure do |config|
      config.api_url = 'http://tpruby.tpondemand.com/api/v1'
      config.username = 'admin'
      config.password = 'admin'
    end
  end

  subject { TargetProcess.client }

  describe '#get' do
    context 'with path like entity/id' do
      it 'returns hash of entity attributes' do
        et = { id: 5, name: 'Task', is_extendable: true, is_searchable: true }

        expect(subject.get('entitytypes/5')).to eql(et)
      end
    end

    context 'with path like entity/' do
      it 'it returns array of entities attributes hashes' do
        i = [{ id: 5, name: 'Task', is_extendable: true, is_searchable: true },
          { id: 6, name: 'User', is_extendable: false, is_searchable: false }]
        resp = subject.get('entitytypes', { orderby: 'id', take: 2, skip: 4 })

        expect(resp[:items]).to eql(i)
      end
    end

    context 'with unexisted path ' do
      it 'it raises UnexpectedError' do
        expect do
          subject.get('foobars/')
        end.to raise_error(TargetProcess::APIError)
      end
    end

    context 'with unexisted id ' do
      it 'it raises NotFound error' do
        expect do
          subject.get('tasks/123123')
        end.to raise_error(TargetProcess::APIError::NotFound)
      end
    end
  end

  describe '#post' do
    context 'with correct path and options' do
      it 'returns hash of entities attributes' do
        resp = subject.post('projects', { name: "foobar#{rand(9_999_999)}" })

        expect(resp[:name]).to match(/foobar/)
        [:id, :name, :description, :start_date, :end_date, :create_date,
        :modify_date, :last_comment_date, :tags, :numeric_priority, :is_active,
        :is_product, :abbreviation, :mail_reply_address, :color, :entity_type,
        :owner, :project, :program, :process, :company, :custom_fields
        ].each do |at|
          expect(resp).to have_key(at)
        end
        subject.delete("projects/#{resp[:id]}")
      end
    end

    context 'with incorrect path and options' do
      it 'raises UnexpectedError' do
        expect do
          subject.post('foo/', { foo: 'Bar' })
        end.to raise_error(TargetProcess::APIError)
      end
    end
  end

  describe '#delete' do
    context 'with url to existed entity' do
      it 'respond with 200 code' do
        project = TargetProcess::Project.new(name: "Foo-#{rand(999_999)}").save
        expect(subject.delete("projects/#{project.id}").code).to eq('200')
      end
    end

    context 'with unexisted id in path' do
      it 'raise NotFound error' do
        expect do
          subject.delete('projects/123')
        end.to raise_error(TargetProcess::APIError::NotFound)
      end
    end
  end
end


