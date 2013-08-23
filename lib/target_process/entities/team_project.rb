module TargetProcess
  class TeamProject < Base
    belongs_to :team
    belongs_to :project
  end
end
