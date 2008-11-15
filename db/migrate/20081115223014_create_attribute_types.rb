class CreateAttributeTypes < ActiveRecord::Migration
  def self.up
    create_table :attribute_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :attribute_types
  end
end
