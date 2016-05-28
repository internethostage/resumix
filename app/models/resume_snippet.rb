class ResumeSnippet < ActiveRecord::Base
  belongs_to :resume
  belongs_to :snippet
end
