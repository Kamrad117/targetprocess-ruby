module TargetProcess
  class TargetProcess::CustomActivity
    include TargetProcess::Base
    has_many :times
    belongs_to :project
    belongs_to :user

  end
end
