$( "#modify" ).submit(function( event ) {
  
    if($('#modnom').val()=='' && $('#modprenom').val()=='' && $('#moddaten').val()=='' &&  $('#modntel').val()=='' &&
      $('#password').val()=='' && $('#confirm_password').val()=='')
    {
     event.preventDefault();
    $('#msgErr').html('Entrée vide');
    }
});
$( "#delete" ).submit(function( eventt ) {
  
    if($('#pswd').val()=='')
    {
        eventt.preventDefault();
        $('#pswdVide').css('color','red');
    }
});