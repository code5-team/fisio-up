#Fórmula Índice de Oxigenação (I.O) também conhecido como Relação PaO2 e FiO2
# indiceOxigenacao
def indiceOxigenacao (pao, fio)
    if (pao > 0 && fio > 0)
        result = pao / fio
        return result
        #Resultados:
        #           result >= 300   Normalidade
        #    200 >= result <= 300   Lesão Pulmonar Aguda (LPA)
        #           result <= 200   Lesão Pulmonar Grave (SARA)
    else
        return -1
    end
end    
    
#Fórmula Pressão Parcial de Oxigênio Ideal
# oxigenioIdeal
def oxigenioIdeal   (idade)
    if (130 > idade && idade > 0)
        result = 109 - (idade * 0.43)
    
    # Resultados: A PaO2 ideal é por volta 80mmHg, pois garante uma saturação
    # de 95% em condições normais
            return result
    else
            return -1
    end
end
        
        
#Fórmula Índice de Respiração Rápida e Superficial (IRRS) ou Índice de Tobin
# indiceRRS
def indiceRRS(fr, vc)
    if (fr > 0 && vc > 0)
        result = fr / vc
        
        # vc = Volume Corrente: DEVE SER LANÇADO NA FÓRMULA EM LITROS
        # IRRS <= 105 IRPM indica normalidade = Preditivo de sucesso de desmame
        # IRRS >= 105 NÃO indicado inciciação de desmame
        # ** alguns autores consideram <= 104 como indice de comparação
        
        return result
    else
        return -1
    end
end


# Fórmula de Complacência Pulmonar Estática
# complacidadePulmonarEstatica
def complacidadePulmonarEstatica (volcorrente, pressaoplato, peep)
    if (volcorrente > 0 && pressaoplato > 0 && peep > 0)
        result = volcorrente / (pressaoplato - peep)
        return result
   
        # Valor Normal: 50 >= result >= 100 mL/cmH20
        # *Niveis Superiores a 30 mL/cmH20  são preditivos de desmame bem suscedido
 
    else
        return -1
    end
end


# Fórmula de Complacência Pulmonar Dinâmica
# complacidadePulmonarDinamica
def complacidadePulmonarDinamica( volcorrente, pressaopico, peep)
    if (volcorrente > 0 && pressaopico > 0 && peep > 0)
        result = volcorrente / (pressaopico - peep)
        return result
          
        # Valor Normal: 100 >= result >= 200 mL/cmH20
        # *Niveis Superiores a 30 mL/cmH20  são preditivos de desmame bem suscedido
        
        else
            return -1
    end
end


# Fórmula da Elastância (Contrária a Complacência)
# elastancia
def elastancia (pressaoplato, peep, volcorrente)
    if (pressaoplato > 0 && peep > 0 && volcorrente > 0)
        result = (pressaoplato - peep) / volcorrente
        return result
        
        # Retorna o valor de elastância
        
    else
        return -1
    end
end


# Fórmula da Resistência do Sistema Pulmonar (Raw)
# resistenciaSistemaPulmonar
def resistenciaSistemaPulmonar (pressaopico, pressaoplato, fluxo)
    if (pressaopico > 0 && pressaoplato > 0 && fluxo > 0)
        result = (pressaopico - pressaoplato) / fluxo
        return result
        
        # Valor Normal: 4 >= result >= 7 cmH2O/L/s
    else
         return -1
    end
end        


# Fórmula da Pressão Inspiratória Máxima em Homens(PImáx)
# pressaoInspiratoriaMaximaHomens
def pressaoInspiratoriaMaximaHomens (idade)
    if (130 > idade && idade > 0)
        result = (0.80 * idade) + 155.3
        return result
        
            # Força muscular inpiratória normal: -80 à -120cmH2O
            # Fraqueza muscular: -70 à -45cmH2O
            # Fadiga muscular respiratória: -40 à -25cmH2O
            # Falência muscular inspiratória: >= -20cmH20
            # Mede a força muscular inspiratória
    else
            return -1
    end
end


# Fórmula da Pressão Inspiratória Máxima em Mulheres(PImáx)
# pressaoInspiratoriaMaximaMulheres
def pressaoInspiratoriaMaximaMulheres (idade)
    if (130 > idade && idade > 0)
        result = (0.49 * idade) + 110.4
        return result
           
            # Força muscular inpiratória normal: -80 à -120cmH2O
            # Fraqueza muscular: -70 à -45cmH2O
            # Fadiga muscular respiratória: -40 à -25cmH2O
            # Falência muscular inspiratória: >= -20cmH20
            # Mede a força muscular inspiratória

    else
        return -1
    end
end


# Fórmula da Pressão Expiratória Máxima em Homens(PEmáx)
# pressaoRespiratoriaMaximaHomens
def pressaoRespiratoriaMaximaHomens (idade)
    if (130 > idade && idade > 0)
        result = (0.81 * idade) + 165.3
        return result
        
        # Valores Normais: 100 à 150cmH2O
        # Mede a força muscular respiratória
    
    else
        return -1
    end
end


# Fórmula da Pressão Expiratória Máxima em Mulher(PEmáx)

def pressaoRespiratoriaMaximaMulheres (idade)
    if (130 > idade && idade > 0)
        result = (0.61 * idade) + 115.6
        return result
        
        # Valores Normais: 100 à 150cmH2O
        # Mede a força muscular respiratória
   
    else
        return -1
    end
end