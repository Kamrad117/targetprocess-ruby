module TargetProcess
  class TargetProcess::FeatureHistory
    include TargetProcess::Base
    belongs_to :entity_state
    belongs_to :modifier, 'GeneralUser'
    belongs_to :feature

  end
end
