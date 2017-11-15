require 'faker'

profile_pic_samples = ["construction-worker_emoji", "female-artist-type-6"]

10.times do
	user = User.new(
		given_name: Faker::Name.first_name,
		family_name: Faker::HarryPotter.house,
		)
	user.username = Faker::Internet.user_name(user.given_name)
	user.email = Faker::Internet.safe_email("#{user.given_name} #{user.family_name}")
	user.password = "password"

	sample = profile_pic_samples.sample

	image_path = File.open("/app/assets/images/seed/#{sample}.png")

	user.profile_pic = image_path
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

personal_goal_content = ["Travel to Spain","Climb on a glacier in Alaska","Learn to windsurf","Learn to Scubadive","Build an art collection","Publish a Short Story","Master 5 magic tricks"]

personal_goal_subgoals = ["Write for a full 12 hours", "Buy a how-to book", "Take a class", "Meet new people who do what I enjoy", "Create a performance for my family", "Visit the museum", "Ignore mom's advice", "Stop buying lottery tickets", ]


health_goal_content = ["Run a 10K","Run a mile in under 8 minutes","Attend yoga three times a week","Develop a nutrition plan","Learn to box","Try new vegetables","Learn to cook 20 new dishes"]

health_goal_subgoals = ["Sign up for a race", "Learn to make more salads", "Take a cooking class", "Buy a cook book", "Get tips from Aunt Tilda", "Throw out all the candy"]


professional_goal_content = ["Apply to new jobs","Complete a leadership training course","Publish in a professional journal","Mentor a junior developer","Start a management position in 4 years","Start my MBA","Start a new business"]

professional_goal_subgoals = ["Make a new contact", "Apply for a course", "Put in an application", "Get a loan", "Attend a networking event", "Build a resume", "Buy a how to book", "Make an awkward phone call", "Ignore dad's advice"]

# HEALTH GOALS
10.times do
	goal = Goal.new(content: health_goal_content.sample, by_when: Faker::Date.between(Date.today, 10.years.from_now), private: false, user_id: rand(1..10), category_id: 1)

	5.times do
		goal.tags << Tag.find(rand(1..15))
	end

	goal.save

	rand(1..4).times do
		g.sub_goals << SubGoal.create(content: health_goal_subgoals.sample, goal_id: g.id, complete: false)
	end

end

#CAREER GOALS
10.times do
	goal = Goal.new(content: professional_goal_content.sample, by_when: Faker::Date.between(Date.today, 10.years.from_now), private: false, user_id: rand(1..10), category_id: 2)

	5.times do
		goal.tags << Tag.find(rand(1..15))
	end

	goal.save

	rand(1..4).times do
		g.sub_goals << SubGoal.create(content: professional_goal_subgoals.sample, goal_id: g.id, complete: false)
	end

end

#PERSONAL GOALS
10.times do
	goal = Goal.new(content: personal_goal_content.sample, by_when: Faker::Date.between(Date.today, 10.years.from_now), private: false, user_id: rand(1..10), category_id: 3)

	5.times do
		goal.tags << Tag.find(rand(1..15))
	end

	goal.save

	rand(1..4).times do
		g.sub_goals << SubGoal.create(content: personal_goal_subgoals.sample, goal_id: g.id, complete: false)
	end

end



RequestStatus.create(name: "Requested")
RequestStatus.create(name: "Accepted")
RequestStatus.create(name: "Denied")

5.times do
	Connection.create(champ_id: rand(1..5), squad_member_id: rand(6..10), status_id: 2)
end

10.times do
	collaborator_one = User.find(rand(1..5))
	collaborator_two = User.find(rand(6..10))

	request = CollaborationRequest.create(request_sender: collaborator_one, request_receiver: collaborator_two, status_id: 2)

	project = Project.create(name: Faker::GameOfThrones.house, description: Faker::Hipster.sentence)

	5.times do
		ProjectObjective.create(content: Faker::TheFreshPrinceOfBelAir.quote, by_when: Faker::Date.between(Date.today, 5.months.from_now), project: project)
	end

	collab_one = Collaboration.create(request: request, project: project, collaborator: collaborator_one)
	collab_two = Collaboration.create(request: request, project: project, collaborator: collaborator_two)
end

50.times do
	Cheer.create(goal_id: rand(1..20), user_id: rand(1..10))
end
