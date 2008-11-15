class CreateStatusTypeAttributes < ActiveRecord::Migration
  def self.up
    create_table :status_type_attributes do |t|
      t.integer :status_type_id
      t.text :api_url_template
      t.integer :attribute_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :status_type_attributes
  end
end
