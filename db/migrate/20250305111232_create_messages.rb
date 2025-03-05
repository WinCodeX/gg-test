class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.integer :conversation_id
      t.integer :sender_id
      t.text :content
      t.boolean :encrypted

      t.timestamps
    end
  end
end
