module TargetProcess
  class RequestType
    include Base
    has_many :requests
  end
end
