module TargetProcess
  class Time
    include Base
    belongs_to :project
    belongs_to :user
    belongs_to :assignable
    belongs_to :role
    belongs_to :custom_activity
  end
end
