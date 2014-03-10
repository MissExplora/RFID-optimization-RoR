class CreateReaders < ActiveRecord::Migration
  def change
    create_table :readers do |t|
      t.string :name
      t.timestamp :start_time
      t.timestamp :last_time
      t.integer :baskets
      t.boolean :working

      t.timestamps
    end
  end
end
