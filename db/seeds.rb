# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Gerando os tipos de Usuario e Status"
StatusUsuario.create!([{descricao: "Ativo"}, {descricao: "Bloqueado"}])
TipoUsuario.create!([{descricao: "Admin"}, {descricao: "Usuario"}])
puts "Gerando os tipos de Usuario e Status [OK]..."