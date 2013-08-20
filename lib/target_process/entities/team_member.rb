module TargetProcess
  class TeamMember
    include Base
    belongs_to :team
    belongs_to :user
    belongs_to :role
  end
end
