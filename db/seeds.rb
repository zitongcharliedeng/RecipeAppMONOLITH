# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#create first recipe as a template to steal image from for empty imaged recipes

User.create(name: 'bob', email: 'bob@gmail.com', password: 'BOB123')
User.create(name: 'bob1', email: 'bob1@gmail.com', password: 'BOB123')
User.create(name: 'bob2', email: 'bob2@gmail.com', password: 'BOB123')
User.create(name: 'bob3', email: 'bob3@gmail.com', password: 'BOB123')
User.create(name: 'bob4', email: 'bob4@gmail.com', password: 'BOB123')
User.create(name: 'bob5', email: 'bob5@gmail.com', password: 'BOB123')

Recipe.create(user_id: '1', title: 'apple pie', instructions: 'mix apples with pie', ingredients: "1 apple \n 1 pie")
Recipe.create(user_id: '2', title: 'apple bread', instructions: 'mix apples with bread', ingredients: "1 apple \n 1 bread")
Recipe.create(user_id: '3', title: 'apple biscuit', instructions: 'mix apples with biscuit', ingredients: "1 apple \n 1 biscuit")
Recipe.create(user_id: '4', title: 'apple orange', instructions: 'mix apples with orange', ingredients: "1 apple \n 1 orange")
Recipe.create(user_id: '5', title: 'apple burger', instructions: 'mix apples with burger', ingredients: "1 apple \n 1 burger")
Recipe.create(user_id: '6', title: 'apple rice', instructions: 'mix apples with rice', ingredients: "1 apple \n 1 rice")

for each in Recipe.all do     
    each.cover_image.attach(io: File.open("#{Rails.root}/app/assets/images/kitten.jpg"), filename: 'kitten.jpg', content_type: 'image/jpg')
end

Rating.create(user_id: '1', recipe_id: '1', rating: 2)
Rating.create(user_id: '1', recipe_id: '2', rating: 1)
Rating.create(user_id: '1', recipe_id: '3', rating: 4)
Rating.create(user_id: '1', recipe_id: '4', rating: 3)
Rating.create(user_id: '1', recipe_id: '5', rating: 5)
Rating.create(user_id: '1', recipe_id: '6', rating: 0)

