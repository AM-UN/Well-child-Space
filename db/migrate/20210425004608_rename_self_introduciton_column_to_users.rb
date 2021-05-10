# frozen_string_literal: true

class RenameSelfIntroducitonColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :self_introduciton, :self_introduction
  end
end
