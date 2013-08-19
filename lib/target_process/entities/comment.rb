module TargetProcess
  class TargetProcess::Comment
    include TargetProcess::Base
    belongs_to :general
    belongs_to :owner, 'GeneralUser'

  end
end
