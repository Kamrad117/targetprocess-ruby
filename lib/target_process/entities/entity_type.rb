module TargetProcess
  class EntityType
    include Base
    has_many :entity_states
  end
end
