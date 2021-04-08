class AddUserIdToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :user, null: false, foreign_key: true
  end
end
