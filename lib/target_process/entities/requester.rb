module TargetProcess
  class Requester < Base
    has_many :assignables
    has_many :comments
    has_many :requests
    belongs_to :company
  end
end
