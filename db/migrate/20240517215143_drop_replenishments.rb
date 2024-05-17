# frozen_string_literal: true

class DropReplenishments < ActiveRecord::Migration[7.1]
  def change
    drop_table :replenishments
  end
end
