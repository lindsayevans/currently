class AddNameToStatusTypeAttributes < ActiveRecord::Migration
  def self.up
    add_column :status_type_attributes, :name, :string
  end

  def self.down
    remove_column :status_type_attributes, :name
  end
end
