users = []

14.times {
  users << User.create!(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: 'password',
    avatar: Faker::Avatar.image(Faker::Lorem.word, "40x40"))
}
