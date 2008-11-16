class AddDisplayTemplateToStatusTypes < ActiveRecord::Migration
  def self.up
    add_column :status_types, :display_template, :text
  end

  def self.down
    remove_column :status_types, :display_template
  end
end
