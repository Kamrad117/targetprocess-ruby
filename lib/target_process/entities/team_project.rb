module TargetProcess
  class TeamProject
    include Base
    belongs_to :team
    belongs_to :project
  end
end
