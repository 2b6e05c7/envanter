# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'a@b.c', password: '123456', first_name: 'Deneme', last_name: 'Kullanıcısı', role: 1)
Group.create(name: 'Sistem Yönetimi')
Group.create(name: 'İçerik Geliştirme')
Group.create(name: 'Halkla İlişkiler ve Destek')
Group.create(name: 'Canlı Ders')
Group.create(name: 'Grafik ve Tasarım')
