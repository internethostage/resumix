class SnippetProperties::SummaryProperty
  include Virtus.model

  attribute :description, String

  def self.dump(properties)
    properties.to_hash
  end

  def self.load(properties)
    new(properties)
  end
end
