# seed data data that you populate the database with at the time it is created.

Peep.delete_all
# Peep.reset_autoincrement

Peep.create!([{ contents: "My First Peep" }])
Peep.create!([{ contents: "Hello, I'm new here"}])

# to add this data to the database
# run rake db:seed
