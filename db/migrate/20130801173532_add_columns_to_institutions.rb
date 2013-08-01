class AddColumnsToInstitutions < ActiveRecord::Migration
  def change
    add_column :institutions, :institution_name, :string
    add_column :institutions, :institution_address, :text
    add_column :institutions, :institute_contact_details, :text
    add_column :institutions, :institution_board, :string
    add_column :institutions, :institute_description, :text
  end
end
