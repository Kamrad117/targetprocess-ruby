module TargetProcess
  class TargetProcess::Time
    include TargetProcess::Base
    belongs_to :project
    belongs_to :user
    belongs_to :assignable
    belongs_to :role
    belongs_to :custom_activity

  end
end
