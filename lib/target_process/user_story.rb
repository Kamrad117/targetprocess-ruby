module TargetProcess
  class Task; include TargetProcess::Base; end

  class UserStory
    include TargetProcess::Base
    has_many :tasks

    belongs_to :project
  end
end
