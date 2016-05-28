class Snippet::AccomplishmentProperty
  include Virtus.model

  attribute :accomplishment, String
  attribute :description, String

  def self.dump(properties)
    properties.to_hash
  end

  def self.load(properties)
    new(properties)
  end
end
