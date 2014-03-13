class AddDefaultValueToWorkingAttribute < ActiveRecord::Migration
  def change
    change_column :readers, :working, :boolean, :default => false
  end
end
