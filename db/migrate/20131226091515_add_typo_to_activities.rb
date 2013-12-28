class AddTypoToActivities < ActiveRecord::Migration
  def change
    # 0: 普通的, 1: 家长, 2: 临时
    add_column :activities, :typo, :integer, default: 0
  end
end
