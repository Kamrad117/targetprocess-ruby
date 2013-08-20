module TargetProcess
  class Milestone
    include Base
    has_many :projects
    belongs_to :owner, 'User'
  end
end
