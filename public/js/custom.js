function flashMessage(data){
    var messages = $('.messages');

        var successHtml = '<div class="alert alert-success">'+
        '<button type="button" class="close" data-dismiss="alert">&times;</button>'+
        '<strong><i class="glyphicon glyphicon-ok-sign push-5-r"></</strong> '+ data.success +
        '</div>';

        $(messages).html(successHtml);
        setTimeout(function(){ messages.fadeOut(3000) }, 3000);
}
