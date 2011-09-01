class AddIsReadToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :is_read, :boolean
  end

  def self.down
    remove_column :contacts, :is_read
  end
end