usuario = $('#get_usuario').parent().find('input');
$('#with-user').on('change', function() {
  if ($(this).hasClass('active')) {
    $(this).removeClass('active');
    usuario.attr('disabled', 'disabled');
  } else {
    $(this).addClass('active');
    usuario.removeAttr('disabled');
  }
});

unidade = $('#get_unidade').parent().find('input');
$('#with-unit').on('change', function() {
  if ($(this).hasClass('active')) {
    $(this).removeClass('active');
    unidade.attr('disabled', 'disabled');
  } else {
    $(this).addClass('active');
    unidade.removeAttr('disabled');
  }
});
