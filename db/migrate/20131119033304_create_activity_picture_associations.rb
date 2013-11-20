class CreateActivityPictureAssociations < ActiveRecord::Migration
  def change
    create_table :activity_picture_associations do |t|
      t.references :activity, index: true
      t.references :picture, index: true

      t.timestamps
    end
  end
end
