class AddMarksToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :marks, :integer
  end
end
