users = [
    {username: 'Dan', email: 'sua@gmail.com'}
]

users.each do |u|
  User.create(u)
end

zines = [
    {title: "Pursued", author: "Andrea M.", content: "many assorted words", user_id: 1}
]

zines.each do |u|
    Zine.create(u)
end