module TargetProcess
  class TaskHistory < Base
    belongs_to :entity_state
    belongs_to :modifier, 'GeneralUser'
    belongs_to :task
  end
end
