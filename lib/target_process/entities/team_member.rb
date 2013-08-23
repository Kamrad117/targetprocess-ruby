module TargetProcess
  class TeamMember < Base
    belongs_to :team
    belongs_to :user
    belongs_to :role
  end
end
