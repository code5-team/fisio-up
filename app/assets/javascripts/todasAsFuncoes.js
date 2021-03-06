var error = "Valores incorretos para calculo!";

function indiceOxigenacao(pao, fio) {
  if (pao > 0 && fio > 0) {
   result = pao / fio;

   if (result > 300)
      return "Resultado: "+ result.toFixed(2) + ". Normalidade"
    else if (result > 200 && result <= 300)
      return "Resultado: "+ result.toFixed(2) + ". Lesão Pulmonar Aguda (LPA)"
    else (result <= 200)
      return "Resultado: "+ result.toFixed(2) + ". Lesão Pulmonar Grave (SARA)"
  } else {
    return error;
  }
}

function oxigenioIdeal(idade) {
  if (130 > idade && idade > 0) {
    result = 109 - (idade * 0.43);

    if (result <= 80)
      return "O seu PaO2 é de "+ result.toFixed(2) +". Está em condições normais."
    else
      return "O seu PaO2 é de "+ result.toFixed(2) +". Não está em condições normais.";
  } else {
    return error;
  }
}

function indiceRRS(fr, vc) {
  if (fr > 0 && vc > 0) {
    result = fr / vc;
    
    if (result <= 105)
      return "IRPM: "+ result.toFixed(2) +". Normalidade.";
    else
      return "IRPM: "+ result.toFixed(2) +". Não indicado, Iniciação de desmame.";
  } else{
    return error;
  }
}

function complacidadePulmonarEstatica(volcorrente, pressaoplato, peep) {
  if (volcorrente > 0 && pressaoplato > 0 && peep > 0) {
    result = volcorrente / (pressaoplato - peep);

    if (result == 0 || result == Infinity)
      return "O Volume corrente não pode ser dividido por 0!! Altere os valores da fórmula.";
    else
      if (result >= 50 || result <= 100)
        return "CPE: "+result.toFixed(2)+". Normalidade";
      else
        return "CPE: "+result.toFixed(2)+". Anormalidade";
  } else {
    return error;
  }
}

function complacidadePulmonarDinamica(volcorrente, pressaoplato, peep) {
  if (volcorrente > 0 && pressaoplato > 0 && peep > 0) {
    result = volcorrente / (pressaoplato - peep);

    if (result == 0 || result == Infinity)
      return "O Volume corrente não pode ser dividido por 0!! Altere os valores da fórmula.";
    else
      if (result >= 100 || result <= 200)
        return "CPD: "+result.toFixed(2)+". Normalidade";
      else
        return "CPD: "+result.toFixed(2)+". Anormalidade";
  } else {
    return error;
  }
}

function elastancia(pressaoplato, peep, volcorrente) {
  if (volcorrente > 0 && pressaoplato > 0 && peep > 0) {
    result = (pressaoplato - peep) / volcorrente;

    return "Valor da Elastancia: "+result.toFixed(2)+".";
  } else {
    return error;
  }
}

function resistenciaSistemaPulmonar(pressaopico, pressaoplato, fluxo) {
  if (pressaopico > 0 && pressaoplato > 0 && fluxo > 0) {
    result = (pressaopico - pressaoplato) / fluxo;

    if (result == 0 || result == Infinity)
      return "O Volume corrente não pode ser dividido por 0!! Altere os valores da fórmula.";
    else
      if (result >= 4 || result <= 7)
        return "RSP: "+result.toFixed(2)+". Normalidade";
      else
        return "RSP: "+result.toFixed(2)+". Anormalidade";
  } else {
    return error;
  }
}

function pressaoInspiratoriaMaximaHomens(idade) {
  if (130 > idade && idade > 0) {
    result = (0.80 * idade) + 155.3;

    if (result <= -20)
      return "Pressao Inspiratoria: "+result.toFixed(2)+". Falência muscular inspiratória.";
    else if (result >= -25 && result <= -40)
      return "Pressao Inspiratoria: "+result.toFixed(2)+". Fadiga muscular respiratória.";
    else if (result >= -45 && result <= -70)
      return "Pressao Inspiratoria: "+result.toFixed(2)+". Fraqueza muscular";
    else
      return "Pressao Inspiratoria: "+result.toFixed(2)+". Força muscular inspiratória normal";
  } else {
    return error;
  }
}

function pressaoInspiratoriaMaximaMulheres(idade) {
  if (130 > idade && idade > 0) {
    result = (0.49 * idade) + 110.4;

    if (result <= -20)
      return "Pressao Inspiratoria: "+result.toFixed(2)+". Falência muscular inspiratória.";
    else if (result >= -25 && result <= -40)
      return "Pressao Inspiratoria: "+result.toFixed(2)+". Fadiga muscular respiratória.";
    else if (result >= -45 && result <= -70)
      return "Pressao Inspiratoria: "+result.toFixed(2)+". Fraqueza muscular";
    else
     return "Pressao Inspiratoria: "+result.toFixed(2)+". Força muscular inspiratória normal";
  } else {
    return error;
  }
}


function pressaoRespiratoriaMaximaHomens(idade) {
  if (130 > idade && idade > 0) {
    result = (0.81 * idade) + 165.3;

    if (result >= 100 && result <= 150)
      return "Pressão Respiratoria Normal. Resultado "+result.toFixed(2)+".";
    else
     return "Pressão Respiratória Anormal. Resultado "+result.toFixed(2)+".";
  } else {
    return error;
  }
}

function pressaoRespiratoriaMaximaMulheres(idade) {
  if (130 > idade && idade > 0) {
    result = (0.61 * idade) + 115.6;

    if (result >= 100 && result <= 150)
      return "Pressao Respiratoria Normal. Resultado "+result.toFixed(2)+".";
    else
     return "Pressao Respiratória Anormal. Resultado "+result.toFixed(2)+".";
  } else {
    return error;
  }
}
