class AddDefaultValueToActiveAttribute < ActiveRecord::Migration
  def change
    change_column :tags, :active, :boolean, :default => false
  end
end
