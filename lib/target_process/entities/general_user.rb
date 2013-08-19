module TargetProcess
  class TargetProcess::GeneralUser
    include TargetProcess::Base
    has_many :assignables
    has_many :comments
    has_many :requests

  end
end
