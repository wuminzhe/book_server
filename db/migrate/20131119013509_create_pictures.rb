class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :year
      t.integer :used
      t.references :activity, index: true

      t.timestamps
    end
  end
end
