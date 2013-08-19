module TargetProcess
  class TargetProcess::Milestone
    include TargetProcess::Base
    has_many :projects
    belongs_to :owner, 'User'

  end
end
