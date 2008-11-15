class CreateStatusTypes < ActiveRecord::Migration
  def self.up
    create_table :status_types do |t|
      t.text :input_template
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :status_types
  end
end
