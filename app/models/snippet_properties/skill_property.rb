class SnippetProperties::SkillProperty
  include Virtus.model

  attribute :skill, String
  attribute :description, String
  attribute :level, String

  def self.dump(properties)
    properties.to_hash
  end

  def self.load(properties)
    new(properties)
  end
end
