module TargetProcess
  class TestPlan < Base
    has_many :comments
    has_many :messages
    has_many :tag_objects, 'Tag'
    has_many :master_relations, 'Relation'
    has_many :slave_relations, 'Relation'
    has_many :attachments
    has_many :test_cases
    has_many :test_plan_runs
    belongs_to :entity_type
    belongs_to :owner, 'GeneralUser'
    belongs_to :last_commented_user, 'GeneralUser'
    belongs_to :project
  end
end
