class Account < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, :encrypted_password, presence: true
end
