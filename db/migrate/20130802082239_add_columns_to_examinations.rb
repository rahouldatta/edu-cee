class AddColumnsToExaminations < ActiveRecord::Migration
  def change
    add_column :examinations, :teacher_id, :integer
    add_column :examinations, :standard, :integer
    add_column :examinations, :difficulty_level, :integer
  end
end
