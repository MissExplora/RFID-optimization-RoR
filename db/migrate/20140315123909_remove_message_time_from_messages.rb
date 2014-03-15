class RemoveMessageTimeFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :message_time, :integer
  end
end
