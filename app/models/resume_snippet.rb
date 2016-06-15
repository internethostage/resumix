class ResumeSnippet < ActiveRecord::Base
  belongs_to :resume
  belongs_to :snippet

  delegate :accomplishments, :details, :educations, :experiences, :interests, :languages, :others, :endorsements, :skills, :summaries, to: :snippets
end
