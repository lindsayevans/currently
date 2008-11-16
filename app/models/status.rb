class Status < ActiveRecord::Base

  has_many :status_attributes
  belongs_to :status_type

  def status_attributes_attributes=(attributes)
logger.debug('adding attributes: '+YAML::dump(attributes))
    attributes.each_pair do |attribute_name, attribute_value|
      status_attributes << StatusAttribute.new(:value => attribute_value, :status_type_attribute => StatusTypeAttribute.find_by_name(attribute_name))
    end
  end

  def display

    display_value = status_type[:display_template]
    status_attributes.each do |attribute|
      attribute_name = attribute.status_type_attribute[:name]
      display_value.gsub! '{' + attribute_name + '}', attribute[:value]
    end
    return display_value

  end

end
