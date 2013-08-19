module TargetProcess
  class TargetProcess::Process
    include TargetProcess::Base
    has_many :entity_states
    has_many :projects
    has_many :practices

  end
end
