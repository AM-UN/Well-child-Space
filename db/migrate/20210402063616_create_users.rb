class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.string :password, null: false
      t.string :profile_image
      t.string :self_introduction

      t.timestamps
    end
  end
end
