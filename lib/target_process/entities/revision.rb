module TargetProcess
  class TargetProcess::Revision
    include TargetProcess::Base
    has_many :revision_files
    has_many :assignables
    belongs_to :project
    belongs_to :author, 'User'

  end
end
