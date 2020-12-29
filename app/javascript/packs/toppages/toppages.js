$(function(){

    $('.c-button').click(
        function(){
            // 切り替えボタンの色付け用
            $('.clicked-btn').removeClass('clicked-btn');
            // 画像切り替え用
            $('.active').removeClass('active');
            var clickedIndex = $('.c-button').index($(this));
            $('.image').eq(clickedIndex).addClass('active');
            $(this).addClass('clicked-btn');
        }
    );


});

import "stylesheets/toppages/toppages.scss";