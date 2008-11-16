class AddValueToStatusAttributes < ActiveRecord::Migration
  def self.up
    add_column :status_attributes, :value, :string
  end

  def self.down
    remove_column :status_attributes, :value
  end
end
