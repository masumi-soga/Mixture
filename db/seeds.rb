# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: "admin@admin.com",
  password: "administrator"
  )

User.create!(
  [
    {
      name: "ギター太郎",
      email: "guitar@user.com",
      password: "123456",
      introduction: "ギターやってます"
    },
    {
      name: "ベース花子",
      email: "base@user.com",
      password: "123456",
      introduction: "ベースやってます"
    },
    {
      name: "ギター次郎",
      email: "guitar2@user.com",
      password: "123456",
      introduction: "リードギターやってます"
    }
  ]
  )

PostContent.create!(
  [
    {
      user_id: "1",
      title: "投稿テストギター",
      text: "とうこうてすと",
    },
    {
      user_id: "2",
      title: "投稿テストベース",
      text: "とうこうてすと",
    },
  ]
  )