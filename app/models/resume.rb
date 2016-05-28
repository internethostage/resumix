class Resume < ActiveRecord::Base
  belongs_to :user
  has_many :resume_snippets
  has_many :snippets, through: :resume_snippets
end
