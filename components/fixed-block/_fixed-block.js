if($('.js-fixed-block').length){
  var offset_this = $('.js-fixed-block').offset();
  var scr_top = $(window).scrollTop();
  $(window).scroll(function() {
    console.log(offset_this.top);
    if (offset_this.top <= scr_top)
      $('.js-fixed-block').addClass("fixed-top");
    else
      $('.js-fixed-block').removeClass("fixed-top");
  });
  $(window).load(function() {
    if (offset_this.top <= scr_top)
      $('.js-fixed-block').addClass("fixed-top");
    else
      $('.js-fixed-block').removeClass("fixed-top");
  });
};