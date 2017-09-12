$(document).ready(function(){
  $('#formula1')    
    .click(function(){
    console.log('Formula 1 clicado!')
    $('#formula1').css("font-weight", "bold")
    $('#formula2').css("font-weight", "normal")
    $('#formula3').css("font-weight", "normal")
    $('#formula4').css("font-weight", "normal");


  });
  
  $('#formula2')
  .click(function(){
    console.log('Formula 2 clicado!')
    $('#formula2').css("font-weight", "bold")
    $('#formula1').css("font-weight", "normal")
    $('#formula3').css("font-weight", "normal")
    $('#formula4').css("font-weight", "normal");

  });

  $('#formula3')
  .click(function(){
    console.log('Formula 3 clicado!')
    $('#formula3').css("font-weight", "bold")
    $('#formula1').css("font-weight", "normal")
    $('#formula2').css("font-weight", "normal")
    $('#formula4').css("font-weight", "normal");

  });

  $('#formula4')
  .click(function(){
    console.log('Formula 4 clicado!')
    $('#formula4').css("font-weight", "bold")
    $('#formula1').css("font-weight", "normal")
    $('#formula2').css("font-weight", "normal")
    $('#formula3').css("font-weight", "normal");

  });

});

    
    
  