module TargetProcess
  class Comment
    include Base
    belongs_to :general
    belongs_to :owner, 'GeneralUser'
  end
end
