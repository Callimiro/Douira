$( "#searchbien" ).submit(function( event ) {
    
    var atLeastOneChecked = false; 
    var i = 1;
    
    while (document.getElementById("typerech-" + i))
    {
     if (document.getElementById("typerech-" + i).checked)
     {
      atLeastOneChecked = true;
      break;
     }
     i++;
    }
    
    if(atLeastOneChecked == false)
    {
     event.preventDefault();
     $('#checkTypeErr').html('Entree vide');
    }
});