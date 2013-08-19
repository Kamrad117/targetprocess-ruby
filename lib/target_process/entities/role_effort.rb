module TargetProcess
  class TargetProcess::RoleEffort
    include TargetProcess::Base
    belongs_to :assignable
    belongs_to :role

  end
end
