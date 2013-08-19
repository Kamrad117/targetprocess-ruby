module TargetProcess
  class TargetProcess::TeamProject
    include TargetProcess::Base
    belongs_to :team
    belongs_to :project

  end
end
