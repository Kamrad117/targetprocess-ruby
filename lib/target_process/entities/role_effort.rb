module TargetProcess
  class RoleEffort
    include Base
    belongs_to :assignable
    belongs_to :role
  end
end
