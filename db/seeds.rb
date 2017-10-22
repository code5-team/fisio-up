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
                
puts "Gerando unidades[OK]..."

puts "gerando eventos de teste"
Event.create!(title: "Matheus Oliveira",
              start: "2017-10-21 09:00:00",
              end: "2017-10-21 18:00:00",
              usuario_id: 2,
              unidade_id: 1)
              
puts "gerando eventos de tests [OK]"