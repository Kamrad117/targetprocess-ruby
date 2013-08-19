module TargetProcess
  class TargetProcess::TeamMember
    include TargetProcess::Base
    belongs_to :team
    belongs_to :user
    belongs_to :role

  end
end
