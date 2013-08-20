module TargetProcess
  class Requester
    include Base
    has_many :assignables
    has_many :comments
    has_many :requests
    belongs_to :company
  end
end
