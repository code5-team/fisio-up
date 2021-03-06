$('.materialize-datepicker').each(function() {
  var input = $(this).pickadate({
    selectMonths: true,
    selectYears: 70,
    max: true,
    closeOnSelect: false,
    labelMonthNext: 'Proximo Mês',
    labelMonthPrev: 'Mês Anterior',
    labelMonthSelect: 'Selecionar Mês',
    labelYearSelect: 'Selecionar Ano',
    monthsFull: [ 'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro' ],
    monthsShort: [ 'Jan', 'Fev', 'Mar', 'Abr', 'Maio', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez' ],
    weekdaysFull: [ 'Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado' ],
    weekdaysShort: [ 'Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb' ],
    weekdaysLetter: [ 'D', 'S', 'T', 'Q', 'Q', 'S', 'S' ],
    today: 'Hoje',
    clear: 'Limpar',
    close: 'Fechar',
    format: 'dd/mm/yyyy'
  }),
      picker = input.pickadate('picker');
  if (picker) {
    picker.set('select', $('.materialize-datepicker').val(), {format: 'yyyy-mm-dd'}).trigger('change');
  }
})

$('select').material_select();
