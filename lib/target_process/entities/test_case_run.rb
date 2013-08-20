module TargetProcess
  class TestCaseRun
    include Base
    has_many :test_cases
    belongs_to :test_plan_run
  end
end
