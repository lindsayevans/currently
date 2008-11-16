class Status < ActiveRecord::Base

  has_many :status_attributes
  has_one :status_type

end
