class AddInstitutionIdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :institution_id, :integer
  end
end
