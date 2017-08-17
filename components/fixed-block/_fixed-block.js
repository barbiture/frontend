if($('.fixed-block').length) {
  var offset_this = $('.fixed-block').offset();
  var scr_top = $(window).scrollTop();
  $(window).scroll(function() {
    if (offset_this.top <= scr_top) {
      $('.fixed-block').addClass("fixed");
    } else{
        $('.fixed-block').removeClass("fixed")
      }
  });

  $(window).load(function() {
    if (offset_this.top <= scr_top) {
      $('.fixed-block').addClass("fixed");
    } else{
        $('.fixed-block').removeClass("fixed")
      }
  });
};
