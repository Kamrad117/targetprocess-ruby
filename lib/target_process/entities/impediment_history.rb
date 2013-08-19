module TargetProcess
  class TargetProcess::ImpedimentHistory
    include TargetProcess::Base
    belongs_to :entity_state
    belongs_to :modifier, 'GeneralUser'
    belongs_to :impediment

  end
end
