import "stylesheets/groups/new.scss";
$(function(){
    //画像選択
    $('.c-img').click(function(){
        $('.selected').removeClass('selected');
        $(this).addClass('selected');
        let clickedIndex = $('.c-img').index($(this));
        $('#group_default_img_ptn').val(clickedIndex);
    });
    $('#group_image').click(function(){
        $('#group_default_img_ptn').val('');
        $('.remove_check').removeClass('hide');
        $('.images').addClass('hide');
        $('#group_remove_image').prop('checked', false);
    });
    $('#group_remove_image').click(function(){
        var checkedFlg = $('#group_remove_image').prop('checked')
        if (checkedFlg) {
            $('.images').removeClass('hide');
        } else {
            $('.images').addClass('hide');
        }

    });

    });