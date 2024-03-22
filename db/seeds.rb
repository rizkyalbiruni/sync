# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb


DialGuess.destroy_all
SetDial.destroy_all
Game.destroy_all
Dial.destroy_all
Topic.destroy_all
Group.destroy_all

Topic.create(topic: 'Food')
Topic.create(topic: 'Movies')
Topic.create(topic: 'Hobbies')

food_topic_id = Topic.find_by(topic: 'Food').id
movies_topic_id = Topic.find_by(topic: 'Movies').id
hobbies_topic_id = Topic.find_by(topic: 'Hobbies').id

Dial.create(left: 'Tasty', right: 'Eww', topic_id: food_topic_id)
Dial.create(left: 'Exciting', right: 'Romantic', topic_id: movies_topic_id)
Dial.create(left: 'Aquatic', right: 'Terrestrial', topic_id: hobbies_topic_id)
Dial.create(left: 'Wet', right: 'Dry', topic_id: food_topic_id)
Dial.create(left: 'Funny', right: 'Terrifying', topic_id: movies_topic_id)
Dial.create(left: 'Creative', right: 'Artistic', topic_id: hobbies_topic_id)
Dial.create(left: 'Sweet', right: 'Savoury', topic_id: food_topic_id)
Dial.create(left: 'Informative', right: 'Imaginary', topic_id: movies_topic_id)
Dial.create(left: 'Relaxing', right: 'Stressful', topic_id: hobbies_topic_id)
Dial.create(left: 'Al dente', right: 'Juicy', topic_id: food_topic_id)
Dial.create(left: 'Intense', right: 'Calm', topic_id: movies_topic_id)
Dial.create(left: 'Serenity', right: 'Adventurous', topic_id: hobbies_topic_id)
Dial.create(left: 'Fresh', right: 'Mature', topic_id: food_topic_id)
Dial.create(left: 'Heartwarming', right: 'Thrilling', topic_id: movies_topic_id)
Dial.create(left: 'Expressive', right: 'Green', topic_id: hobbies_topic_id)
Dial.create(left: 'Spicy', right: 'Mild', topic_id: food_topic_id)
Dial.create(left: 'Happy', right: 'Sad', topic_id: movies_topic_id)
Dial.create(left: 'Stationary', right: 'Active', topic_id: hobbies_topic_id)
