class Snippet < ActiveRecord::Base

  belongs_to :user
  has_many :resumes, through: :resume_snippets

  has_many :versions, class_name: "Snippet", foreign_key: "versions_of_id"
  belongs_to :version_of, class_name: "Snippet"

  scope :accomplishments, -> { where(type: 'Accomplishment') }
  scope :details,         -> { where(type: 'Detail') }
  scope :educations,      -> { where(type: 'Education') }
  scope :endorsements,    -> { where(type: 'Endorsement') }
  scope :experiences,     -> { where(type: 'Experience') }
  scope :interests,       -> { where(type: 'Interest') }
  scope :languages,       -> { where(type: 'Language') }
  scope :others,          -> { where(type: 'Other') }
  scope :skills,          -> { where(type: 'Skill') }
  scope :summaries,       -> { where(type: 'Summary') }

  class << self
    def types
      %w(Accomplishment Detail Education Endorsement Experience Interest Language Other Skill Summary)
    end
  end


end
