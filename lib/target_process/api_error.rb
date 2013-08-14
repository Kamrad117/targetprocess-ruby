module TargetProcess
  class APIError < StandardError
    class BadRequest < APIError; end
    class NotFound < APIError; end
    class MethodNotAllowed < APIError; end
    class InternalServerError < APIError; end
    class Forbidden < APIError; end
    class NotImplemented < APIError; end
    class Unauthorized < APIError; end

    def self.parse(response)
      error = response['Error']
      status = error['Status'] || response['Status'] || 'Undefined'
      message = raw_message(response.parsed_response)
      type = "#{self}::#{status}".safe_constantize
      constants.include?(status.to_sym) ? type.new(message) : new(message)
    end

    def self.raw_message(response)
      case response
      when Hash
        response['Error']['Message']
      when String
        response.match(/<title>(.+)<\/title>/)[1]
      end
    end

  end
end
