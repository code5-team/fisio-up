$('.sandwich').on('click', function() {
  $(this).parent().addClass('opened');
  $('body').addClass('nav-opened');
});

$('.nav-overlay').on('click', function() {
  $(this).parent().removeClass('opened');
  $('body').removeClass('nav-opened');
});
