class Snippet::InterestProperty
  include Virtus.model

  attribute :interest, String
  attribute :description, String

  def self.dump(properties)
    properties.to_hash
  end

  def self.load(properties)
    new(properties)
  end
end
