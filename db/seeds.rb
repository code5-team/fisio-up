# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Gerando os cadastros..."
puts "Gerando o cadastro de administrador do Code5"

Usuario.create!(nome: 'Code5 Development', 
                email: 'code5.development@gmail.com', 
                crefito: "101010",
                datanascimento: '2017-06-01',
                admin: true,
                ativo: true,
                password_digest: Usuario.digest("admin123"),
                telefones_attributes: [
                   { numero: '115568913'}
                  ]
              )
              
Usuario.create!(nome: 'Matheus Oliveira', 
                email: 'matheus.oliveira@msn.com', 
                crefito: "152030",
                datanascimento: '2017-06-01',
                admin: true,
                ativo: true,
                password_digest: Usuario.digest("teste"),
                telefones_attributes: [
                   { numero: '1156315601'}
                  ]
              )

Usuario.create!(nome: 'Roberto Almeida', 
                email: 'roberto.almeida@msn.com', 
                crefito: "152030",
                datanascimento: '2017-06-01',
                admin: true,
                ativo: true,
                password_digest: Usuario.digest("teste"),
                telefones_attributes: [
                   { numero: '1156315601'}
                  ]
              )              
puts "Criando os cadastros de testes..."

Usuario.create!(nome: 'Teste da Silva', 
                email: 'teste@teste.com.br', 
                crefito: "306045",
                datanascimento: '2017-06-01',
                admin: false,
                ativo: false,
                password_digest: Usuario.digest("teste"),
                telefones_attributes: [
                   { numero: '1156315601'}
                  ]
              )
              
Usuario.create!(nome: 'Ppkeiro Clasheiro', 
                email: 'ppclash@teste.com.br', 
                crefito: "9049420",
                datanascimento: '2017-06-01',
                admin: false,
                ativo: false,
                password_digest: Usuario.digest("teste"),
                telefones_attributes: [
                   { numero: '1156315601'}
                  ]
              )
              
Usuario.create!(nome: 'Juca de Oliveira', 
                email: 'juca@teste.com.br', 
                crefito: "1219048",
                datanascimento: '2017-06-01',
                admin: false,
                ativo: false,
                password_digest: Usuario.digest("teste"),
                telefones_attributes: [
                   { numero: '1156315601'}
                  ]
              )
              
Usuario.create!(nome: 'Juca da Salinha', 
                email: 'barrinha@teste.com.br', 
                crefito: "483489",
                datanascimento: '2017-06-01',
                admin: false,
                ativo: false,
                password_digest: Usuario.digest("teste"),
                telefones_attributes: [
                   { numero: '1156315601'}
                  ]
              )
              
puts "Gerando os cadastros [OK]..."

puts "Gerando os tipos de unidades..."
TipoUnidade.create!(descricao: 'Hospital')
TipoUnidade.create!(descricao: 'Clínica')
puts "Gerando os tipos de unidades [OK]..."

puts "Gerando os tipos de plantão..."
TipoPlantao.create!(descricao: 'disponivel')
TipoPlantao.create!(descricao: 'ocupado')
TipoPlantao.create!(descricao: 'aguardando encerramento')
puts "Gerando os tipos de plantão[OK]..."

puts "Gerando unidades..."
Unidade.create!(nome: 'Clinica Dona Isabel',
                localizacao: 'Vila Olimpia',
                tipo_unidade_id: 1)
                
Unidade.create!(nome: 'Clinica Dona Benta',
                localizacao: 'Vila Olimpia',
                tipo_unidade_id: 1)
                
puts "Gerando unidades[OK]..."

puts "gerando eventos de teste"

cedo ='#ff6f00'
tarde = '#424242'
adm = '#0d47a1'

datainicio = DateTime.new(2017,10,1,7,0,0)
datafim = DateTime.new(2017,10,1,19,0,0)

40.times do
  Event.create!(title: "Matheus Oliveira",
              start: datainicio,
              end: datafim,
              usuario_id: 2,
              unidade_id: 1,
              tipo_atendimento: 1,
              color: cedo)
  
  datainicio = datainicio + 1.days
  datafim = datafim + 1.days
end

datainicio = DateTime.new(2017,10,1,19,0,0)
datafim = DateTime.new(2017,10,2,7,0,0)

40.times do
  Event.create!(title: "Roberto Almeida",
              start: datainicio,
              end: datafim,
              usuario_id: 3,
              unidade_id: 1,
              tipo_atendimento: 2,
              color: tarde)
  
  datainicio = datainicio + 1.days
  datafim = datafim + 1.days
end

datainicio = DateTime.new(2017,10,1,8,0,0)
datafim = DateTime.new(2017,10,1,13,0,0)


40.times do
  Event.create!(title: "Juca de Oliveira",
              start: datainicio,
              end: datafim,
              usuario_id: 6,
              unidade_id: 1,
              tipo_atendimento: 3,
              color: adm)
  
  datainicio = datainicio + 1.days
  datafim = datafim + 1.days
end

datainicio = DateTime.new(2017,10,1,7,0,0)
datafim = DateTime.new(2017,10,1,19,0,0)

40.times do
  Event.create!(title: "Matheus Oliveira",
              start: datainicio,
              end: datafim,
              usuario_id: 2,
              unidade_id: 2,
              tipo_atendimento: 1,
              color: cedo)
  
  datainicio = datainicio + 1.days
  datafim = datafim + 1.days
end

datainicio = DateTime.new(2017,10,1,19,0,0)
datafim = DateTime.new(2017,10,2,7,0,0)

40.times do
  Event.create!(title: "Roberto Almeida",
              start: datainicio,
              end: datafim,
              usuario_id: 3,
              unidade_id: 2,
              tipo_atendimento: 2,
              color: tarde)
  
  datainicio = datainicio + 1.days
  datafim = datafim + 1.days
end

puts "gerando eventos de tests [OK]"