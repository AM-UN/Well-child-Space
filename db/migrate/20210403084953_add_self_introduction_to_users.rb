# frozen_string_literal: true

class AddSelfIntroductionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :self_introduciton, :string
  end
end
