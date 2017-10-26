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

Usuario.create!(nome: 'Lucas almeida', 
                email: 'lucas.almeida@msn.com', 
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

cedo ='#ff6f00'
tarde = '#424242'
adm = '#0d47a1'

Event.create!(title: "Matheus Oliveira",
              start: "2017-10-21 07:00:00",
              end: "2017-10-21 19:00:00",
              usuario_id: 2,
              unidade_id: 1,
              tipo_atendimento: 1,
              color: cedo)

Event.create!(title: "Code5 Development",
              start: "2017-10-21 19:00:00",
              end: "2017-10-22 07:00:00",
              usuario_id: 1,
              unidade_id: 1,
              tipo_atendimento: 2,
              color: tarde)    

Event.create!(title: "Lucas Almeida",
              start: "2017-10-21 08:00:00",
              end: "2017-10-21 17:00:00",
              usuario_id: 3,
              unidade_id: 1,
              tipo_atendimento: 3,
              color: adm)   
              
              
              
Event.create!(title: "Matheus Oliveira",
              start: "2017-10-24 07:00:00",
              end: "2017-10-24 19:00:00",
              usuario_id: 2,
              unidade_id: 1,
              tipo_atendimento: 1,
              color: cedo)

Event.create!(title: "Code5 Development",
              start: "2017-10-24 19:00:00",
              end: "2017-10-25 07:00:00",
              usuario_id: 1,
              unidade_id: 1,
              tipo_atendimento: 2,
              color: tarde)    

Event.create!(title: "Lucas Almeida",
              start: "2017-10-23 08:00:00",
              end: "2017-10-23 17:00:00",
              usuario_id: 3,
              unidade_id: 1,
              tipo_atendimento: 3,
              color: adm)  
              
Event.create!(title: "Matheus Oliveira",
              start: "2017-10-01 19:00:00",
              end: "2017-10-02 07:00:00",
              usuario_id: 2,
              unidade_id: 1,
              tipo_atendimento: 2,
              color: tarde)
              
Event.create!(title: "Code5 Development",
              start: "2017-10-22 08:00:00",
              end: "2017-10-22 17:00:00",
              usuario_id: 1,
              unidade_id: 1,
              tipo_atendimento: 3,
              color: adm)
              
Event.create!(title: "Code5 Development",
              start: "2017-10-23 08:00:00",
              end: "2017-10-23 17:00:00",
              usuario_id: 1,
              unidade_id: 1,
              tipo_atendimento: 3,
              color: adm)
              
Event.create!(title: "Code5 Development",
              start: "2017-10-15 19:00:00",
              end: "2017-10-16 07:00:00",
              usuario_id: 1,
              unidade_id: 1,
              tipo_atendimento: 2,
              color: tarde)
              
Event.create!(title: "Lucas almeida",
              start: "2017-10-29 08:00:00",
              end: "2017-10-29 17:00:00",
              usuario_id: 3,
              unidade_id: 1,
              tipo_atendimento: 3,
              color: adm) 
              
Event.create!(title: "Matheus Oliveira",
              start: "2017-10-27 07:00:00",
              end: "2017-10-27 19:00:00",
              usuario_id: 2,
              unidade_id: 1,
              tipo_atendimento: 1,
              color: cedo)
              
Event.create!(title: "Code5 Development",
              start: "2017-10-27 19:00:00",
              end: "2017-10-28 07:00:00",
              usuario_id: 1,
              unidade_id: 1,
              tipo_atendimento: 2,
              color: tarde)
              
puts "gerando eventos de tests [OK]"