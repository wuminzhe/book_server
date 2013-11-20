class CreateStudentPictureAssociations < ActiveRecord::Migration
  def change
    create_table :student_picture_associations do |t|
      t.references :student, index: true
      t.references :picture, index: true

      t.timestamps
    end
  end
end
