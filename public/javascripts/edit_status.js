
$('status_status_type_id').observe('change', update_status_type_fields);

function update_status_type_fields(event){
  var status_type_id = parseInt(event.element().getValue());

  status_types.each(function(status_type){
console.debug(status_type.status_type)
    if(status_type.status_type['id'] == status_type_id){
      $('status_type_fields').update(build_status_type_fields(status_type.status_type));
      return;
    }
  });

}

function build_status_type_fields(status_type){
  return status_type['input_template'].replace(/\{([a-z0-9]+)\}/gi, '<input type="text" name="status[status_attributes][$1]" id="status_status_attributes_$1" />');
}
