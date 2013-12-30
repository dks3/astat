# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Subdivision.create(title: 'Отделение № 1')
Subdivision.create(title: 'Отделение № 2')
Subdivision.create(title: 'Отделение № 3')
Subdivision.create(title: 'Отделение № 4')
Function.create(title: 'Начальник отдела', rank: 1)
Function.create(title: 'Зам. Начальника отдела', rank: 2)
Function.create(title: 'Главный бухгалтел', rank: 3)
Function.create(title: 'Бухгалтер', rank: 4)
Function.create(title: 'Главный менеджер', rank: 5)
Function.create(title: 'Менеджер', rank: 6)
Function.create(title: 'Техник', rank: 7)
Function.create(title: 'Уборщик', rank: 8)

