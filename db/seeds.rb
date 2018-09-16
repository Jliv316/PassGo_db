# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: "Ray", email: "Ray@ray.com", token: "KbIFV2FF6lXS6LjZSoNeXZ5sLuu1")
company = Company.create(name: "Slice Works", street: "1433 17th St", city: "Denver", state: "CO", zip_code: 80202, industry: "Pizza", lat: 39.7514038, lng: -104.9975539)
Turing = Company.create(name: "Turing: School of Software and Design", street: "1331 17th St")
UserCompany.create(user_id: user.id, company_id: company.id)
