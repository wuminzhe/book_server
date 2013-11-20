class AddSrcToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :src, :string
  end
end
