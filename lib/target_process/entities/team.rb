module TargetProcess
  class Team < Base
    has_many :comments
    has_many :messages
    has_many :tag_objects, 'Tag'
    has_many :master_relations, 'Relation'
    has_many :slave_relations, 'Relation'
    has_many :attachments
    has_many :team_members
    has_many :team_projects
    has_many :assignables
    has_many :user_stories
    has_many :tasks
    has_many :bugs
    has_many :requests
    has_many :features
    has_many :team_iterations
    belongs_to :entity_type
    belongs_to :owner, 'GeneralUser'
    belongs_to :last_commented_user, 'GeneralUser'
    belongs_to :project
  end
end
