module TargetProcess
  class TargetProcess::Requester
    include TargetProcess::Base
    has_many :assignables
    has_many :comments
    has_many :requests
    belongs_to :company

  end
end
