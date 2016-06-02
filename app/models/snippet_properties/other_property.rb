class SnippetProperties::OtherProperty
  include Virtus.model

  attribute :title, String
  attribute :custom, String
  attribute :custom2, String
  attribute :start_date, String
  attribute :end_date, String

  def self.dump(properties)
    properties.to_hash
  end

  def self.load(properties)
    new(properties)
  end
end
