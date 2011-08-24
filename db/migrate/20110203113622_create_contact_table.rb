class CreateContactTable < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :order_number
      t.text :message
      t.references :topic
      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end