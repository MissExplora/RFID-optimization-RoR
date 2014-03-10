class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :type
      t.timestamp :start_time
      t.timestamp :last_time
      t.boolean :active

      t.timestamps
    end
  end
end
