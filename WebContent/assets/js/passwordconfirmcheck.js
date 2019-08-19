$('#password, #confirm_password').on('keyup', function () {
    
     if ($('#password').val() == $('#confirm_password').val() && $('#confirm_password').val()!='' && $('#password').val()!='') {
       $('#match').html('Ok').css('color', 'green');
     }    
    else if ($('#confirm_password').val()=='' || $('#password').val()=='')
    {
        $('#match').html('')
    }
     else 
     $('#match').html('Les mots de passe ne correspondent pas. Veuillez réessayer').css('color', 'red');  
});