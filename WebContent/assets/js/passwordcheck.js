$( "#signupform" ).submit(function( event ) {
    
    if($('#password').val() != $('#confirm_password').val())
    {
     event.preventDefault();
     $('#msgErr').html('mots de passe ne correspondent pas, veuillez réessayer !');
    }
    
});

$( "#modify" ).submit(function( event ) {
    
    if($('#password').val() != $('#confirm_password').val())
    {
     event.preventDefault();
    }
    
});