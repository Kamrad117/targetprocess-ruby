module TargetProcess
  class GeneralUser < Base
    has_many :assignables
    has_many :comments
    has_many :requests
  end
end
