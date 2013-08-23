module TargetProcess
  class Attachment < Base
    belongs_to :owner, 'GeneralUser'
    belongs_to :general
    belongs_to :message
  end
end
