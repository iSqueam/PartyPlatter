# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

characters = Character.create([{
    #user_id: "tester",
    name: "Test Character",
    strength: "10",
    dexterity: "10",
    constitution: "10",
    intelligence: "10",
    wisdom: "10",
    charisma: "10"
}])

campaigns = Campaign.create([{
    created_by: "Test DM",
    name: "Dungeon Divers",
    minplayers: "3",
    maxplayers: "5"
}])

users = User.create([{
    email: "blank@blank.blank",
    username: "blanky"
}])