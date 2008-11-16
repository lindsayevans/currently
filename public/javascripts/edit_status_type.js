
var existing_type_attributes = {};

$('status_type_input_template').observe('keyup', update_status_type_attributes);

function update_status_type_attributes(event){
  var input_template_value = $(event).element().getValue();

  var template_matches = input_template_value.match(/\{([a-z0-9]+)\}/gi);

  if(template_matches != null){
    template_matches.each(function(match){
      var name = match.replace(/[{}]*/g, '');
      if(!existing_type_attributes[name]){
        existing_type_attributes[name] = true;
        insert_new_status_type_attribute();
        var inserted_name_field = $('status_type_attributes').down('.status_type_attribute:last-child').down('#status_type_new_status_type_attribute_attributes__name');
        inserted_name_field.value = name;
// TODO: remove from existing_type_attributes when it's deleted 
      }
    });
  }
//console.debug(existing_type_attributes)
}
