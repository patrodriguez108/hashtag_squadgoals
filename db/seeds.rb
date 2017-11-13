require 'faker'

10.times do
	user = User.new(
		given_name: Faker::Name.first_name,
		family_name: Faker::HarryPotter.house,
		)
	user.username = Faker::Internet.user_name(user.given_name)
	user.email = Faker::Internet.safe_email("#{user.given_name} #{user.family_name}")
	user.password = "password"
	user.save

	Vision.create(
		statement: Faker::HeyArnold.quote,
		timeframe: Faker::Date.between(Date.today, 10.years.from_now),
		user_id: user.id
		)
end

Category.create(name: "Health")
Category.create(name: "Career")
Category.create(name: "Personal")

Tag.create(name: "design")
Tag.create(name: "business")
Tag.create(name: "technology")
Tag.create(name: "photography")
Tag.create(name: "film")
Tag.create(name: "writing")
Tag.create(name: "crafts")
Tag.create(name: "culinary")
Tag.create(name: "music")
Tag.create(name: "athletics")
Tag.create(name: "running")
Tag.create(name: "swimming")
Tag.create(name: "mindfulness")
Tag.create(name: "dance")
Tag.create(name: "volunteering")

20.times do
	goal = Goal.new(content: Faker::HarryPotter.quote, by_when: Faker::Date.between(Date.today, 10.years.from_now), private: false, user_id: rand(1..10), category_id: rand(1..3))

	5.times do
		goal.tags << Tag.find(rand(1..15))
	end

	goal.save
end


RequestStatus.create(name: "Requested")
RequestStatus.create(name: "Accepted")
RequestStatus.create(name: "Denied")

5.times do
	Connection.create(champ_id: rand(1..10), squad_member_id: rand(1..10), status_id: rand(1..3))
end
