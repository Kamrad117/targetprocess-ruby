module TargetProcess
  class Impediment
    include Base
    has_many :comments
    has_many :messages
    has_many :tag_objects, 'Tag'
    has_many :master_relations, 'Relation'
    has_many :slave_relations, 'Relation'
    has_many :attachments
    has_many :history, 'ImpedimentHistory'
    belongs_to :entity_type
    belongs_to :owner, 'GeneralUser'
    belongs_to :last_commented_user, 'GeneralUser'
    belongs_to :project
    belongs_to :assignable
    belongs_to :entity_state
    belongs_to :priority
    belongs_to :responsible, 'User'
  end
end
