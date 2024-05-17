class Product < ApplicationRecord
  belongs_to :account

  validates :name, :quantity, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :low_stock, -> { where(quantity: 1) }
  scope :out_of_stock, -> { where(quantity: 0) }
  scope :active, -> { where(archived: false) }
end
