# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id                 :integer          not null, primary key
#  email              :string           not null
#  encrypted_password :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Account < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, :encrypted_password, presence: true
end
