Role.create(name: 'moderator')
Role.create(name: 'admin')

user1 = User.create(email: 'admin@test.com',
          password: '123456',
          password_confirmation: '123456')
user1.add_role(:admin)
user2 = User.create(email: 'user@test.com',
          password: '123456',
          password_confirmation: '123456')
user2.add_role(:moderator)
