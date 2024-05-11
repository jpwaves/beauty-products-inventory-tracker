class Replenishment < ApplicationRecord
  belongs_to :account
  belongs_to :product

  scope :unfulfilled, -> { where(fulfilled_at: nil) }

  # TODO: figure out how to add a unique index on account_id and product_id and fulfilled_at when fulfilled_at is nil, and also look into what indexes are to begin with
end
