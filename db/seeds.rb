# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Cadastrando as CATEGORIAS..."

categories = [ "Animais e Acessórios",
               "Esportes",
               "Para a Sua Casa",
               "Eletrônicos e Celulares",
               "Músicas e Hobbies",
               "Bebês e Crianças",
               "Moda e Beleza",
               "Veículos e Barcos",
               "Imóveis",
               "Empregos e Negócios"
                ]

categories.each do |category|
  Category.find_or_create_by!(description: category)
end

puts "Categorias Cadastradas com Sucesso..."

#########################################################

puts "Cadastrando o Administrador padrão."

  Admin.create!(
        name: "Administrator",
        email: "admin@admin.com",
        password: "123456",
        password_confirmation: "123456",
        role: 0
                )

puts "Administrador padrão cadastrado com sucesso"

#########################################################

puts "Cadastrando o Membro padrão."

  Member.create!(
        email: "weslley@admin.com",
        password: "123456",
        password_confirmation: "123456"
                                      )

puts "Membro padrão cadastrado com sucesso"