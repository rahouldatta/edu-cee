class AddMoreColumnsToMembers < ActiveRecord::Migration
  def change
    add_column :members, :first_name, :string
    add_column :members, :last_name, :string
    add_column :members, :age, :string
    add_column :members, :qualifications, :string
  end
end
