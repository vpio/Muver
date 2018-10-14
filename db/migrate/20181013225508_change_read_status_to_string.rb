class ChangeReadStatusToString < ActiveRecord::Migration[5.2]
  def up
    change_column :notifications, :read_status, :string, :default => "false"
  end

  def down
    change_column :notifications, :read_status, :boolean
  end
end
