class AddTypoToAdministrator < ActiveRecord::Migration
  def change
    # 0: 大管理员，1: 学校管理员[，2: 班级管理员（老师）]
    add_column :administrators, :typo, :integer, default: 1
  end
end
