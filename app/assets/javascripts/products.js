$(function() {
  if (window.location.pathname != '/products/new') { return; }

  getTemplateProperties( $( '#product_template option:selected' ).val() )

  $('select').on('change', function (e) {
    getTemplateProperties( this.value )
  });

});

function getTemplateProperties(template_id) {
  $.ajax({
    type: 'GET',
    url: '/templates/' + template_id + '.json',
    success: function(data){
      setProperties(data.properties);
    }
  });
};

function setProperties(data) {
  $( '#product_properties' ).val(data);
}
