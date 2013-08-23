module TargetProcess
  class Milestone < Base
    has_many :projects
    belongs_to :owner, 'User'
  end
end
