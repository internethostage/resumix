class Snippet::LanguageProperty
  include Virtus.model

  attribute :language, String
  attribute :level, String

  def self.dump(properties)
    properties.to_hash
  end

  def self.load(properties)
    new(properties)
  end
end
