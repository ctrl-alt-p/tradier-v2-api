class StockIndex < ActiveRecord::Base
  # Attributes:
  # - id
  # - slug
  # - name
  # - description
  # - symbols

  include FriendlyId
  friendly_id :name, use: :slugged

  serialize :symbols, Array

  has_many :companies,  -> { where(symbol: symbols) }
end
