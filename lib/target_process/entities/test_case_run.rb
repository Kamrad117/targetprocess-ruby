module TargetProcess
  class TargetProcess::TestCaseRun
    include TargetProcess::Base
    has_many :test_cases
    belongs_to :test_plan_run

  end
end
