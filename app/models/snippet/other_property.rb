class Snippet::OtherProperty
  include Virtus.model

  attribute :title, String
  attribute :custom, String
  attribute :custom2, String
  attribute :date_start, Date
  attribute :date_end, Date

  def self.dump(properties)
    properties.to_hash
  end

  def self.load(properties)
    new(properties)
  end
end
