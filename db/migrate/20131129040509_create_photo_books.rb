class CreatePhotoBooks < ActiveRecord::Migration
  def change
    create_table :photo_books do |t|
      t.integer :student_id
      t.integer :template_id
      t.text :content

      t.timestamps
    end
  end
end
