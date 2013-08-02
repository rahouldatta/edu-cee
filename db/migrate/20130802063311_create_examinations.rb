class CreateExaminations < ActiveRecord::Migration
  def change
    create_table :examinations do |t|
      t.integer :institution_id
      t.string :subject
      t.string :chapter
      t.integer :total_marks
      t.integer :total_time

      t.timestamps
    end
  end
end
