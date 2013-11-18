class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :phone
      t.references :klass, index: true

      t.timestamps
    end
  end
end
