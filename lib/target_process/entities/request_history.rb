module TargetProcess
  class RequestHistory < Base
    belongs_to :entity_state
    belongs_to :modifier, 'GeneralUser'
    belongs_to :request
  end
end
