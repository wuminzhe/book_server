class AddTemplateToStudent < ActiveRecord::Migration
  def change
    add_column :students, :template, :text
  end
end
