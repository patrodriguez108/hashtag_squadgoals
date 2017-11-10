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


70.times do
	tag = Tag.create(name: Faker::Food.dish.downcase)
	GoalTag.create(tag_id: tag.id, goal_id: rand(1..20))
end

Category.create(name: "Health")
Category.create(name: "Career")
Category.create(name: "Personal")

ConnectionStatus.create(name: "Requested")
ConnectionStatus.create(name: "Accepted")
ConnectionStatus.create(name: "Denied")

5.times do
	Connection.create(champ_id: rand(1..10), squad_member_id: rand(1..10), status_id: rand(1..3))
end

20.times do
	Goal.create(content: Faker::HarryPotter.quote, by_when: Faker::Date.between(Date.today, 10.years.from_now), private: false, user_id: rand(1..10), category_id: rand(1..3))
end
