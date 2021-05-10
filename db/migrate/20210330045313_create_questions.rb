# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :question_content, null: false
      t.string :question_image

      t.timestamps
    end
  end
end
