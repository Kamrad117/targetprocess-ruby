module TargetProcess
  class TargetProcess::TestPlanRun
    include TargetProcess::Base
    has_many :comments
    has_many :messages
    has_many :tag_objects, 'Tag'
    has_many :master_relations, 'Relation'
    has_many :slave_relations, 'Relation'
    has_many :attachments
    has_many :assigned_user, 'GeneralUser'
    has_many :assignments
    has_many :impediments
    has_many :times
    has_many :role_efforts
    has_many :revisions
    has_many :test_case_runs
    belongs_to :entity_type
    belongs_to :owner, 'GeneralUser'
    belongs_to :last_commented_user, 'GeneralUser'
    belongs_to :project
    belongs_to :release
    belongs_to :iteration
    belongs_to :team_iteration
    belongs_to :team
    belongs_to :priority
    belongs_to :entity_state
    belongs_to :build
    belongs_to :test_plan

  end
end
