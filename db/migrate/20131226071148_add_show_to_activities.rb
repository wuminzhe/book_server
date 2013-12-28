class AddShowToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :show, :boolean, default: true
  end
end
