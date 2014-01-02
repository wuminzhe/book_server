class AddHomeToAdministrator < ActiveRecord::Migration
  def change
    add_column :administrators, :home, :string
  end
end
