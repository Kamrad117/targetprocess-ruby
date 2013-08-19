module TargetProcess
  class TargetProcess::Role
    include TargetProcess::Base
    has_many :role_efforts
    has_many :entity_states

  end
end
