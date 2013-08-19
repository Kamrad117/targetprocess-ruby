module TargetProcess
  class TargetProcess::EntityType
    include TargetProcess::Base
    has_many :entity_states

  end
end
