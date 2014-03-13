class ChangeTimestampToInteger < ActiveRecord::Migration
  def change
    change_column :tags, :start_time, :integer
    change_column :tags, :last_time, :integer
    change_column :readers, :start_time, :integer
    change_column :readers, :last_time, :integer
    change_column :messages, :message_time, :integer
  end
end
