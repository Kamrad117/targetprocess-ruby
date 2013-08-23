module TargetProcess
  class Relation < Base
    belongs_to :master, 'General'
    belongs_to :slave, 'General'
    belongs_to :relation_type
  end
end
