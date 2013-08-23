module TargetProcess
  class Project < Base
    has_many :comments
    has_many :messages
    has_many :tag_objects, 'Tag'
    has_many :master_relations, 'Relation'
    has_many :slave_relations, 'Relation'
    has_many :attachments
    has_many :generals
    has_many :features
    has_many :releases
    has_many :iterations
    has_many :user_stories
    has_many :tasks
    has_many :bugs
    has_many :test_cases
    has_many :test_plans
    has_many :builds
    has_many :times
    has_many :revisions
    has_many :custom_activities
    has_many :project_members
    has_many :team_projects
    has_many :requests
    has_many :test_plan_runs
    has_many :milestones
    belongs_to :entity_type
    belongs_to :owner, 'GeneralUser'
    belongs_to :last_commented_user, 'GeneralUser'
    belongs_to :project
    belongs_to :program
    belongs_to :process
    belongs_to :company
  end
end
