module TargetProcess
  class TargetProcess::EntityState
    include TargetProcess::Base
    has_many :next_states, 'EntityState'
    has_many :previous_states, 'EntityState'
    belongs_to :role
    belongs_to :entity_type
    belongs_to :process

  end
end
