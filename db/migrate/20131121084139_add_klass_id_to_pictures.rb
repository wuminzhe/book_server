class AddKlassIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :klass_id, :integer
  end
end
