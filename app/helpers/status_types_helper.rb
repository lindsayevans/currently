module StatusTypesHelper

  def add_status_type_attribute_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :status_type_attributes, :partial => 'status_type_attribute', :object => StatusTypeAttribute.new
    end
  end

end
