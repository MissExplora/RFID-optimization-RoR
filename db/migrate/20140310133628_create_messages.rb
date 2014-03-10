class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :reader_id
      t.integer :tag_id
      t.timestamp :message_time
      t.string :activity

      t.timestamps
    end
  end
end
