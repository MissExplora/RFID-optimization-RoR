class AddDefaultValueToBasketsAttribute < ActiveRecord::Migration
  def change
    change_column :readers, :baskets, :integer, :default => 0
  end
end
