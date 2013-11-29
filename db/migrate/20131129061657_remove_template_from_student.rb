class RemoveTemplateFromStudent < ActiveRecord::Migration
  def change
    remove_column :students, :template
  end
end
