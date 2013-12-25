class CreateFrames < ActiveRecord::Migration
  def change
    create_table :frames do |t|
      t.string :src

      t.timestamps
    end
  end
end
