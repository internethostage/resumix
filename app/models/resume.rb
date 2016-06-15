class Resume < ActiveRecord::Base
  belongs_to :user
  has_many :resume_snippets, dependent: :destroy
  has_many :snippets, through: :resume_snippets

  delegate :accomplishments, :details, :educations, :experiences, :interests, :languages, :others, :endorsements, :skills, :summaries, to: :snippets

  validates :name, presence: true, uniqueness: true

end
