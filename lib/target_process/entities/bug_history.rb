module TargetProcess
  class TargetProcess::BugHistory
    include TargetProcess::Base
    belongs_to :entity_state
    belongs_to :modifier, 'GeneralUser'
    belongs_to :bug

  end
end
