class AddSchoolIdToAdministrators < ActiveRecord::Migration
  def change
    add_column :administrators, :school_id, :integer
  end
end
