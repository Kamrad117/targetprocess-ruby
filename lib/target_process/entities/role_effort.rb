module TargetProcess
  class RoleEffort < Base
    belongs_to :assignable
    belongs_to :role
  end
end
