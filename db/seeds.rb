User.create(
  email: 'a@b.c',
  password: '123456',
  first_name: 'Douglas',
  last_name: 'Harper',
  role: :admin,
  locale: :tr
)

User.create(
  email: 'cliffberry@b.c',
  password: '123456',
  first_name: 'Cliff',
  last_name: 'Berry',
  role: :staff,
  locale: :tr
)

User.create(
  email: 'RussellMRedd@b.c',
  password: '123456',
  first_name: 'Russell',
  last_name: 'Redd',
  role: :responsible,
  locale: :tr
)

User.create(
  email: 'LisaRMiller@b.c',
  password: '123456',
  first_name: 'Lisa',
  last_name: 'Miller',
  role: :manager,
  locale: :tr
)

Group.create(name: 'Sistem Yönetimi', coordinator_id: 1)
Group.create(name: 'İçerik Geliştirme', coordinator_id: 2)
Group.create(name: 'Halkla İlişkiler ve Destek', coordinator_id: 1)
Group.create(name: 'Canlı Ders', coordinator_id: 2)
Group.create(name: 'Grafik ve Tasarım', coordinator_id: 1)

Group.find(1).users << User.find(1)
Group.find(3).users << User.find(1)
Group.find(5).users << User.find(1)

Group.find(2).users << User.find(2)
Group.find(4).users << User.find(2)
Group.find(5).users << User.find(2)

Group.find(3).users << User.find(3)
Group.find(3).users << User.find(4)

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
  warranty_end: '2019-12-23',
  end_of_lifetime: 2025
)

Product.create(
  name: 'Samsung N145 Plus',
  template_id: 1,
  company: 'Samsung',
  properties: '{}',
  year: 2017,
  warranty: 36,
  status: 'free',
  warranty_end: '2020-09-21',
  end_of_lifetime: 2022
)

Product.create(
  name: 'XYZ 170x70 Masa',
  template_id: 2,
  company: 'XYZ ',
  properties: '{}',
  year: 2006,
  warranty: 12,
  status: 'free',
  warranty_end: '2008-08-06',
  end_of_lifetime: 2019
)

Product.create(
  name: 'ABCD Çalışma Koltuğu',
  template_id: 2,
  company: 'ABCD',
  properties: '{}',
  year: 2014,
  warranty: 24,
  status: 'free',
  warranty_end: '2016-03-01',
  end_of_lifetime: 2024
)
