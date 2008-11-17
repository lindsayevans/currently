class StatusType < ActiveRecord::Base

  has_many :status_type_attributes

  after_update :save_status_type_attributes

  def existing_status_type_attribute_attributes=(status_type_attribute_attributes)
    status_type_attributes.reject(&:new_record?).each do |status_type_attribute|
      attributes = status_type_attribute_attributes[status_type_attribute.id.to_s]
      if attributes
        status_type_attribute.attributes = attributes
      else
        status_type_attributes.delete(status_type_attribute)
      end
    end
  end

  def new_status_type_attribute_attributes=(status_type_attribute_attributes)
    status_type_attribute_attributes.each do |attributes|
      status_type_attributes.build(attributes)
    end
  end

  def save_status_type_attributes
    status_type_attributes.each do |status_type_attribute|
      status_type_attribute.save(false)
    end
  end

end
