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

Template.create(
  name: 'Bilgisayar',
  properties:  <<-HEREDOC
  {
    "ram": 0,
    "memory_speed": 0,
    "cpu": "",
    "gpu": "",
    "max_screen_resolution": 123,
    "hard_drive": ""
  }
  HEREDOC
)

Template.create(
  name: 'Mobilya',
  properties:  <<-HEREDOC
  {
    "color": "",
    "parts": 0,
    "size": "",
    "weight": "123"
  }
  HEREDOC
)

Product.create(
  name: 'Toshiba Satellite C55-A-1K0',
  template_id: 1,
  company: 'Toshiba',
  properties: '{}',
  year: 2015,
  warranty: 24,
  status: 'free',
  warranty_end: '2019-12-23'
)

Product.create(
  name: 'Samsung N145 Plus',
  template_id: 1,
  company: 'Samsung',
  properties: '{}',
  year: 2017,
  warranty: 36,
  status: 'free',
  warranty_end: '2020-09-21'
)

Product.create(
  name: 'XYZ 170x70 Masa',
  template_id: 2,
  company: 'XYZ ',
  properties: '{}',
  year: 2006,
  warranty: 12,
  status: 'free',
  warranty_end: '2008-08-06'
)

Product.create(
  name: 'ABCD Çalışma Koltuğu',
  template_id: 2,
  company: 'ABCD',
  properties: '{}',
  year: 2014,
  warranty: 24,
  status: 'free',
  warranty_end: '2016-03-01'
)
