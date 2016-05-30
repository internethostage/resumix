class SnippetProperties::DetailProperty
  include Virtus.model

  attribute :first_name, String
  attribute :last_name, String
  attribute :address, String
  attribute :address2, String
  attribute :zipcode, String
  attribute :phone, String
  attribute :email, String
  attribute :linkedin, String
  attribute :github, String
  attribute :other, String

  def self.dump(properties)
    properties.to_hash
  end

  def self.load(properties)
    new(properties)
  end
end
