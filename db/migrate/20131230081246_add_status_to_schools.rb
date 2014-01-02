class AddStatusToSchools < ActiveRecord::Migration
  def change
    # 0: 删除, 1: 正常
    add_column :schools, :status, :integer, default: 1
  end
end
