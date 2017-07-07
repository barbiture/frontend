
var toggle = $('#menuToggleLevel'),
    subToggle = $('.menu__sub__toggle');
// console.log(subToggle);
toggle.prepend('<i></i><i></i><i></i>');


toggle.click(function() {  // открывается первый уровень меню
  $('.menu__level').toggleClass('menu__level_active');  // добавляем класс для всего меню (ширина меню)
  $('.menu__content').toggleClass('menu__content_active');  // показываем контент првого уровня меню (ставим положение left = 0)
  $('.menu__shift').toggleClass('menu__shift_active');  // сдвигаем основной контент на право
});

subToggle.click(function() {  // открывается подменю

  var $this = $(this)  // определяем родителя
  if($this.hasClass('menu__sub__toggle_active')) {
    console.log('true');
    $this.removeClass('menu__sub__toggle_active');
    $this.parents('.menu__sub').prev()
         .removeClass('menu__sub__toggle_hide')
         .addClass('menu__sub__toggle_active');

  } else {
    console.log('false');
    $this.addClass('menu__sub__toggle_active');

    $this.parents('.menu__sub').prev()
         .addClass('menu__sub__toggle_hide')
         .removeClass('menu__sub__toggle_active');
  }
  // $this.parents('.menu__content__sub')
  //      .find('.menu__sub__toggle_active')
  //      .toggleClass('menu__sub__toggle_hide')
  //      .removeClass('menu__sub__toggle_active');
  

  var sub = $this.next();  // назначаем соседний элемент
  sub.toggleClass('menu__sub__level_active');  // отображаем подменю
  $this.parent().siblings().toggleClass('menu__content__sub_hide');  // скрываем все пукнкты верхнего меню
  


});
$('.menu__sub__back').click(function() {
  var $this = $(this);
  $this.parent('.menu__sub__toggle').next().removeClass('menu__sub_active');
  // $this.addClass('menu__sub__toggle_hide');
})