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
require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test 'validates email uniqueness' do
    account = Account.new(email: 'test@email.com', encrypted_password: 'password')
    account.save

    assert Account.new(email: 'new_email@email.com', encrypted_password: 'password').valid?
    assert Account.new(email: 'test@email.com', encrypted_password: 'password').invalid?
  end

  test 'validates email and encrypted_password presence' do
    assert Account.new(email: 'test@email.com', encrypted_password: 'password').valid?
    assert Account.new(encrypted_password: 'password').invalid?
    assert Account.new(email: 'test@email.com').invalid?
  end
end
