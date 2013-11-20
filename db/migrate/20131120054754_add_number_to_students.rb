class AddNumberToStudents < ActiveRecord::Migration
  def change
    add_column :students, :number, :integer
  end
end
