module TargetProcess
  class Role < Base
    has_many :role_efforts
    has_many :entity_states
  end
end
