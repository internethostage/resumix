class SnippetProperties::EndorsementProperty
  include Virtus.model

  attribute :fullname, String
  attribute :position, String
  attribute :company, String
  attribute :email, String
  attribute :phone, String

  def self.dump(properties)
    properties.to_hash
  end

  def self.load(properties)
    new(properties)
  end
end
