module TargetProcess
  class Assignment
    include Base
    belongs_to :assignable
    belongs_to :general_user, 'User'
    belongs_to :role
  end
end
