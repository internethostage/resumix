class Resume < ActiveRecord::Base
  belongs_to :user
  has_many :resume_snippets
  has_many :snippets, through: :resume_snippets

  delegate :accomplishments, :details, :educations, :experiences, :interests, :languages, :others, :endorsements, :skills, :summaries, to: :snippets

end
