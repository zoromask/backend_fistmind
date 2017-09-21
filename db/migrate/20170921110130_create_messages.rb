class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :sender
      t.integer :receiver

      t.timestamps
    end
  end
end
