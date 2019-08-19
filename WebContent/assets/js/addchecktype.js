$('#colo-non').on('click',function() {
    $(capacite).prop("disabled",true);
});
$('#colo-oui').on('click',function() {
    $(capacite).prop("disabled",false);
});

$('input[type="radio"]').on('click',function(){

    if($('#type-5').prop('checked') || $('#type-6').prop('checked') || $('#type-7').prop('checked'))
    {
        $(nbpiece).prop("disabled",true);
        $(nbetage).prop("disabled",true);
        $(nbfac).prop("disabled",true);
        $('#colo-oui').prop("disabled",true);
        $('#colo-non').prop("disabled",true);
        $('#meub-oui').prop("disabled",true);
        $('#meub-non').prop("disabled",true);
        $('#accessoire-1').prop("disabled",true);
        $('#accessoire-2').prop("disabled",true);
        $('#accessoire-3').prop("disabled",true);
        $('#accessoire-4').prop("disabled",true);
        $('#accessoire-5').prop("disabled",true);
        $('#accessoire-6').prop("disabled",true);
    }
    else
    {
        $(nbpiece).prop("disabled",false);
        $(nbetage).prop("disabled",false);
        $(nbfac).prop("disabled",false);
        $('#colo-oui').prop("disabled",false);
        $('#colo-non').prop("disabled",false);
        $('#meub-oui').prop("disabled",false);
        $('#meub-non').prop("disabled",false);
        $('#accessoire-1').prop("disabled",false);
        $('#accessoire-2').prop("disabled",false);
        $('#accessoire-3').prop("disabled",false);
        $('#accessoire-4').prop("disabled",false);
        $('#accessoire-5').prop("disabled",false);
        $('#accessoire-6').prop("disabled",false);
    }
});