class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title, null: false
      t.text :message
      t.boolean :read, null: false
      t.integer :creator_id, null: false
      t.integer :recipient_id, null: false
      t.timestamps
    end
  end
end
