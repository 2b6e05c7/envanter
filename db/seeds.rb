User.create(
  email: 'a@b.c',
  password: '123456',
  first_name: 'Deneme',
  last_name: 'Kullanıcısı',
  role: :admin
)
Group.create(name: 'Sistem Yönetimi')
Group.create(name: 'İçerik Geliştirme')
Group.create(name: 'Halkla İlişkiler ve Destek')
Group.create(name: 'Canlı Ders')
Group.create(name: 'Grafik ve Tasarım')
