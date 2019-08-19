$(function(){
    $('#datedebutlocation').prop('min', function(){
        var date = new Date();
        date.setDate(date.getDate()+1);
        return date.toJSON().split('T')[0];
    });
    $('#datedebutlocation').prop('max', function(){
        var date = new Date();
        date.setDate(date.getDate()+8);
        return date.toJSON().split('T')[0];
    });
});