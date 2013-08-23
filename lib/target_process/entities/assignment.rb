module TargetProcess
  class Assignment < Base
    belongs_to :assignable
    belongs_to :general_user, 'User'
    belongs_to :role
  end
end
