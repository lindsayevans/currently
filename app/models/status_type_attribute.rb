class StatusTypeAttribute < ActiveRecord::Base

  belongs_to :status_type
  has_one :attribute_type

end
