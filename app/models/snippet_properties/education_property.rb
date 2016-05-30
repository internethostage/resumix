class SnippetProperties::EducationProperty
  include Virtus.model

  attribute :title, String
  attribute :institution, String
  attribute :location, String
  attribute :start_date, Date
  attribute :end_date, Date
  attribute :details, String

  def self.dump(properties)
    properties.to_hash
  end

  def self.load(properties)
    new(properties)
  end
end
