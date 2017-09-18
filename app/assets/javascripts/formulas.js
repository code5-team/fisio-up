$('.formula').each(function(obj){
  $(this).on('click', function(){
    var index = obj+1;
    menuSelecionado("#formula-"+index, "#form-"+index);
  });
});


$('.btn').each(function(obj){
  $(this).on('click', function(){
    var index = obj+1,
      resultado = $(".resultado-tela");

    switch(index) {
      case 1:
        resultado.html(indiceOxigenacao($('#vl1-form1').val(), $('#vl2-form1').val()));
        break;
      case 2:
        resultado.html(oxigenioIdeal($('#vl1-form2').val()));
        break;
      case 3:
        resultado.html(indiceRRS($('#vl1-form3').val(), $('#vl2-form3').val()));
        break;
      case 4:
        resultado.html(complacidadePulmonarEstatica($('#vl1-form4').val(), 
          $('#vl2-form4').val(), 
          $('#vl3-form4').val()));
        break;
      case 5:
        resultado.html(complacidadePulmonarDinamica($('#vl1-form5').val(), 
          $('#vl2-form5').val(),
          $('#vl3-form5').val())); 
        break;
      case 6:
        resultado.html(elastancia($('#vl1-form6').val(), 
          $('#vl2-form6').val(),
          $('#vl3-form6').val()));
        break;
      case 7:
        resultado.html(resistenciaSistemaPulmonar($('#vl1-form7').val(), 
          $('#vl2-form7').val(),
          $('#vl3-form7').val()));
        break;
      case 8:
        resultado.html(pressaoInspiratoriaMaximaHomens($('#vl1-form8').val()));
        break;
      case 9:
        resultado.html(pressaoInspiratoriaMaximaMulheres($('#vl1-form9').val()));
        break;
      case 10:
        resultado.html(pressaoRespiratoriaMaximaHomens($('#vl1-form10').val()));
        break;
      case 11:
        resultado.html(pressaoRespiratoriaMaximaMulheres($('#vl1-form11').val()));
        break;          
    }
    
    

  });
});
