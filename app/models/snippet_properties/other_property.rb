class SnippetProperties::OtherProperty
  include Virtus.model

  attribute :title, String
  attribute :custom, String
  attribute :custom2, String
  attribute :start_date, Date
  attribute :end_date, Date

  def self.dump(properties)
    properties.to_hash
  end

  def self.load(properties)
    new(properties)
  end
end
