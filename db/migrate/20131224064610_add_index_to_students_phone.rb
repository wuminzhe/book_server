class AddIndexToStudentsPhone < ActiveRecord::Migration
  def change
    add_index :students, :phone, unique: true
  end
end
