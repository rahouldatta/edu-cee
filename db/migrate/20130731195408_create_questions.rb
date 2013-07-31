class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :examination_id
      t.text :question
      t.string :correct_answer
      t.text :incorrect_answers
      t.float :answer_tat
      t.integer :difficulty_level

      t.timestamps
    end
  end
end
