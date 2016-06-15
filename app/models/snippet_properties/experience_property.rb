class SnippetProperties::ExperienceProperty
  include Virtus.model

  attribute :title, String
  attribute :organization, String
  attribute :location, String
  attribute :start_date, String
  attribute :end_date, String
  attribute :details, String

  def self.dump(properties)
    properties.to_hash
  end

  def self.load(properties)
    new(properties)
  end
end
