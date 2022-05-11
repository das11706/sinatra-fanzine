users = [
    {username: 'Dan', email: 'su@gmail.com'}
]

users.each do |u|
  User.create(u)
end

zines = [
    {title: "Pursued", creator: "Andrea M.", content: "many interesting words", user_id: 1}
]

zines.each do |u|
    Zine.create(u)
end