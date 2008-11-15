class CreateStatusAttributes < ActiveRecord::Migration
  def self.up
    create_table :status_attributes do |t|
      t.integer :status_id
      t.integer :status_type_attribute_id

      t.timestamps
    end
  end

  def self.down
    drop_table :status_attributes
  end
end
