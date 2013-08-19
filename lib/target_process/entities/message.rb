module TargetProcess
  class TargetProcess::Message
    include TargetProcess::Base
    has_many :generals
    has_many :attachments
    belongs_to :from, 'GeneralUser'
    belongs_to :to, 'GeneralUser'
    belongs_to :message_uid

  end
end
