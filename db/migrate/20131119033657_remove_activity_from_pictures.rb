class RemoveActivityFromPictures < ActiveRecord::Migration
  def change
    remove_column :pictures, :activity_id
  end
end
