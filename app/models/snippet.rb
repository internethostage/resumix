class Snippet < ActiveRecord::Base

  belongs_to :user
  has_many :resumes, through: :resume_snippets

  has_many :versions, class_name: "Snippet", foreign_key: "versions_of_id"
  belongs_to :version_of, class_name: "Snippet"


end
