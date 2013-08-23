module TargetProcess
  class Iteration < Base
    has_many :comments
    has_many :messages
    has_many :tag_objects, 'Tag'
    has_many :master_relations, 'Relation'
    has_many :slave_relations, 'Relation'
    has_many :attachments
    has_many :assignables
    has_many :user_stories
    has_many :tasks
    has_many :bugs
    has_many :test_plan_runs
    has_many :requests
    has_many :builds
    belongs_to :entity_type
    belongs_to :owner, 'GeneralUser'
    belongs_to :last_commented_user, 'GeneralUser'
    belongs_to :project
    belongs_to :release
  end
end
