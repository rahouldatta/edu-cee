class AddColumnToExaminations < ActiveRecord::Migration
  def change
    add_column :examinations, :allow_test, :boolean
  end
end
