module TargetProcess
  class User < Base
    has_many :assignables
    has_many :comments
    has_many :requests
    has_many :times
    has_many :impediments
    has_many :custom_activities
    has_many :revisions
    has_many :team_members
    has_many :project_members
    has_many :milestones
    belongs_to :role
  end
end
