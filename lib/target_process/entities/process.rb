module TargetProcess
  class Process < Base
    has_many :entity_states
    has_many :projects
    has_many :practices
  end
end
