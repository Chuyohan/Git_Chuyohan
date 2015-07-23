# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = [ "연극", "문화", "체육", "학술", "봉사", "종교"]

categories.each do |category|
	0.upto(2) do |i|
		c = Club.new 
		c.name = Faker::Name.name
		c.manager = i + 1
		c.category = category
		c.save
	end
end
