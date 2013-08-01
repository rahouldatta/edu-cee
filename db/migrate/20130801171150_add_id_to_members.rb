class AddIdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :institution_specific_id, :string
  end
end
