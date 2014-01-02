class AddSchoolIdToKlasses < ActiveRecord::Migration
  def change
    add_column :klasses, :school_id, :integer
  end
end
