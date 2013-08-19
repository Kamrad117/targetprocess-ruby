
module TargetProcess
  class Task
    include TargetProcess::Base
    belongs_to :user_story
  end

  class UserStory
    include TargetProcess::Base
    has_many :tasks
    has_many :bugs
    has_many :assigned_user, 'GeneralUser'
    belongs_to :project
  end
end
