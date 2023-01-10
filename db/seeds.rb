# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#create first recipe as a template to steal image from for empty imaged recipes

User.create(name: 'Alice', email: 'alice@gmail.com', password: 'ALICE123')
User.create(name: 'Bob', email: 'bob@gmail.com', password: 'BOB123')
User.create(name: 'Charlie', email: 'charlie@gmail.com', password: 'CHARLIE123')

Recipe.create(user_id: '1', title: 'Apple Pie', instructions: "Get your apple\nGet your pie\nMix both ingredients in a bowl\nServe with ketchup!", ingredients: "1 apple\n1 pie\n1 bowl\n Ketchup source").cover_image.attach(io: File.open("#{Rails.root}/app/assets/images/pexels-photo-9622370.jpeg"), filename: 'pexels-photo-9622370.jpg', content_type: 'image/jpeg')

Recipe.create(user_id: '2', title: 'Apple Bread', instructions: "Get your apple\nGet your bread loaf\n Mix both ingredients in a plate\n Sprinkle sugar on the bottom\n Serve with a cup of water!", ingredients: "1 apple\n1 bread loaf\n 1 plate\n Bag of sugar\n Water").cover_image.attach(io: File.open("#{Rails.root}/app/assets/images/pexels-sunsetoned-10026638.jpg"), filename: 'pexels-sunsetoned-10026638.jpg', content_type: 'image/jpg')

Recipe.create(user_id: '3', title: 'Banana Pie', instructions: "Get your banana\nGet your pie\nMix both ingredients in a large bowl\nServe with mustard!", ingredients: "1 banana\n1 pie\n1 mustard jar\n1 large bowl").cover_image.attach(io: File.open("#{Rails.root}/app/assets/images/pexels-marta-dzedyshko-7451860.jpg"), filename: 'pexels-marta-dzedyshko-7451860.jpg', content_type: 'image/jpg')

Rating.create(user_id: '1', recipe_id: '1', rating: 5)
Rating.create(user_id: '1', recipe_id: '2', rating: 4)
Rating.create(user_id: '1', recipe_id: '3', rating: 2)
Comment.create(user_id: '1', recipe_id: '1', content: "Guys, I forgot to say - make sure you wash your bowl before using it!")
Comment.create(user_id: '1', recipe_id: '2', content: "This is quite tasty.")
Comment.create(user_id: '1', recipe_id: '3', content: "Eh... I could make a better one ;)")

Rating.create(user_id: '2', recipe_id: '1', rating: 0)
Rating.create(user_id: '2', recipe_id: '2', rating: 5)
Rating.create(user_id: '2', recipe_id: '3', rating: 4)
Comment.create(user_id: '2', recipe_id: '1', content: "Horrible. Threw up everywhere after 1 bite... Waste of time :(")
Comment.create(user_id: '2', recipe_id: '2', content: "My favourite recipe of all time")
Comment.create(user_id: '2', recipe_id: '3', content: "second only to my recipes!1!!")

Rating.create(user_id: '3', recipe_id: '1', rating: 3)
Rating.create(user_id: '3', recipe_id: '2', rating: 1)
Rating.create(user_id: '3', recipe_id: '3', rating: 5)
Comment.create(user_id: '3', recipe_id: '1', content: "Decent flavor. 3/5 from me")
Comment.create(user_id: '3', recipe_id: '2', content: "Not the best I've seen. You should be adding salt to balance the flavors!")
Comment.create(user_id: '3', recipe_id: '3', content: "wow whoever made this should win a prize!!!")