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

# Remover todos os dados existentes para evitar duplicações
Journey.destroy_all
Task.destroy_all
World.destroy_all
Path.destroy_all
User.destroy_all

# Criando usuários
user1 = User.create!(
  email: "user1@example.com",
  password: "password123",
  password_confirmation: "password123"
)

user2 = User.create!(
  email: "user2@example.com",
  password: "password123",
  password_confirmation: "password123"
)

# Criando caminhos (paths)
path1 = Path.create!(
  title: "Journey to the Unknown",
  description: "A thrilling adventure full of surprises."
)

path2 = Path.create!(
  title: "The Culinary Quest",
  description: "A journey to explore the world of culinary delights."
)

# Criando mundos (worlds)
world1 = World.create!(
  title: "Mystical Forest",
  done: false,
  path: path1
)

world2 = World.create!(
  title: "Cooking in Paris",
  done: false,
  path: path2
)

world3 = World.create!(
  title: "Enchanted Castle",
  done: true,
  path: path1
)

# Criando tarefas (tasks) associadas a mundos
task1 = Task.create!(
  title: "Find the secret ingredient",
  ingredients: "Mushrooms, herbs",
  steps: "Explore the forest and find the rare mushrooms.",
  done: false,
  world: world1
)

task2 = Task.create!(
  title: "Make a Parisian soufflé",
  ingredients: "Eggs, cheese, butter, flour",
  steps: "Follow the recipe carefully to make the perfect soufflé.",
  done: false,
  world: world2
)

task3 = Task.create!(
  title: "Defeat the dragon",
  ingredients: "Sword, shield, potion",
  steps: "Enter the castle and defeat the dragon guarding the treasure.",
  done: true,
  world: world3
)

# Criando jornadas (journeys)
Journey.create!(
  user: user1,
  path: path1
)

Journey.create!(
  user: user2,
  path: path2
)

# Exibindo informações para confirmar que o seeding foi bem-sucedido
puts "Seed data successfully created!"
