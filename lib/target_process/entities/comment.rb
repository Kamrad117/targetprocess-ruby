module TargetProcess
  class Comment < Base
    belongs_to :general
    belongs_to :owner, 'GeneralUser'
  end
end
