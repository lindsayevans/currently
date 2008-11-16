class AddStatusTypeIdToStatuses < ActiveRecord::Migration
  def self.up
    add_column :statuses, :status_type_id, :integer
  end

  def self.down
    remove_column :statuses, :status_type_id
  end
end
