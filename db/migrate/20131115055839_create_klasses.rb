class CreateKlasses < ActiveRecord::Migration
  def change
    create_table :klasses do |t|
      t.string :name
      t.integer :grade
      t.integer :number
      t.integer :user_id

      t.timestamps
    end
  end
end
