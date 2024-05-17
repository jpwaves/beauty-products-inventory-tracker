# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id                         :integer          not null, primary key
#  name                       :string           not null
#  quantity                   :integer          not null
#  purchase_link              :string
#  purchase_link_website_name :string
#  account_id                 :integer          not null
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  archived                   :boolean          default(FALSE), not null
#
class Product < ApplicationRecord
  belongs_to :account

  validates :name, :quantity, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :low_stock, -> { where(quantity: 1) }
  scope :out_of_stock, -> { where(quantity: 0) }
  scope :active, -> { where(archived: false) }
end
