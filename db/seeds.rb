# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)  
  

    types = ['Volunteering','Familia Social', 'Study Social', 'General Meeting', 'Fundraising', 'Other']
    org = ['820933','419D78','F6EFA6','3ABEFF','0B032D','CC5803']

    types.zip(org).each do |name,color| 
      Category.create(name: name, color: color)
      puts(name, color)
    end