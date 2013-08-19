module TargetProcess
  class TargetProcess::ProjectMember
    include TargetProcess::Base
    belongs_to :project
    belongs_to :user
    belongs_to :role

  end
end
