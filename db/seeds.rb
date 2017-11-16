require 'faker'

profile_pic_samples = ["construction-worker_emoji", "female-artist-type-6", "female-astronaut-type-3", "female-cook-type-3", "female-cook-type-5", "female-factory-worker-type-1-2", "female-judge-type-6", "female-pilot-type-4", "female-scientist-type-5", "female-singer-type-1-2", "female-sleuth-type-3", "male-artist-type-4", "male-astronaut-type-6", "male-factory-worker-type-3", "male-pilot-type-3", "male-scientist-type-1-2", "male-singer-type-5", "prince_emoji-modifier-fitzpatrick", "princess_emoji-modifier-fitzpatrick-type-6", "sleuth-or-spy_emoji-modifier-fitzpatrick-type-5", "woman-mage-medium-skin-tone", "male-teacher-type-1-2", "woman-vampire-medium-skin-tone", "elf_emoji-modifier-fitzpatrick-type-3", "female-farmer-type-1-2_1f469-1f3fb-200d-1f33e"]

10.times do
	user = User.new(
		given_name: Faker::Name.first_name,
		family_name: Faker::HarryPotter.house,
		)
	user.username = Faker::Internet.user_name(user.given_name)
	user.email = Faker::Internet.safe_email("#{user.given_name} #{user.family_name}")
	user.password = "password"

	sample = profile_pic_samples.sample

	image_path = File.open(File.join(Rails.root, 'app', "/assets/images/seed/#{sample}.png"))

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



health_goal_content = ["Run a 10K","Run a mile in under 8 minutes","Attend yoga three times a week","Develop a nutrition plan","Learn to box","Try new vegetables","Learn to cook 20 new dishes", "Eat more fish", "Learn to skydive", "Learn soccer", "Coach my kids volleyball team"]

health_goal_subgoals = ["Sign up for a race", "Learn to make more salads", "Take a cooking class", "Buy a cook book", "Get tips from Aunt Tilda", "Throw out all the candy", "Buy a new spatula", "Throw out Paula Dean's cookbooks", "Join a soccer team", "Buy more cheese", "Find a yoga studio", "Buy new running shoes", "Find a trainer"]


professional_goal_content = ["Apply to new jobs","Complete a leadership training course","Publish in a professional journal","Mentor a junior developer","Start a management position in 4 years","Start my MBA","Start a new business", "Design my first website", "Learn Python", "Learn React"]

professional_goal_subgoals = ["Make a new contact", "Apply for a course", "Put in an application", "Get a loan", "Attend a networking event", "Build a resume", "Buy a how to book", "Make an awkward phone call", "Ignore dad's advice", "Go to a Rails meetup", "Attend a Python meet-up", "Edit my resume", "Have my resume reviewed"]


personal_goal_content = ["Travel to Spain","Climb on a glacier in Alaska","Learn to windsurf","Learn to Scubadive","Build an art collection","Publish a Short Story","Master 5 magic tricks", "Watch only quality television", "Try a new cheese every week", "Try 52 new beers this year", "Start journaling and get my kids journaling", "Volunteer more with Big Brothers, Big Sisters" ]

personal_goal_subgoals = ["Write for a full 12 hours", "Buy a how-to book", "Take a class", "Meet new people who do what I enjoy", "Create a performance for my family", "Visit the museum", "Ignore mom's advice", "Stop buying lottery tickets", "Throw out useless anti-aging skin creams", "Find TV shows I like", "Select an animal shelter to volunteer for"]

# HEALTH GOALS
10.times do
	goal = Goal.new(content: health_goal_content.sample, by_when: Faker::Date.between(Date.today, 10.years.from_now), private: false, user_id: rand(1..10), category_id: 1)

	rand(1..5).times do
		goal.tags << Tag.find(rand(1..15))
	end

	goal.save

	rand(1..3).times do
		goal.sub_goals << SubGoal.create(content: health_goal_subgoals.sample, goal_id: goal.id, complete: false)
	end

	rand(1..3).times do
		goal.sub_goals << SubGoal.create(content: health_goal_subgoals.sample, goal_id: goal.id, complete: true)
	end

end

#CAREER GOALS
10.times do
	goal = Goal.new(content: professional_goal_content.sample, by_when: Faker::Date.between(Date.today, 10.years.from_now), private: false, user_id: rand(1..10), category_id: 2)

	rand(1..5).times do
		goal.tags << Tag.find(rand(1..15))
	end

	goal.save

	rand(1..4).times do
		goal.sub_goals << SubGoal.create(content: professional_goal_subgoals.sample, goal_id: goal.id, complete: false)
	end

	rand(1..4).times do
		goal.sub_goals << SubGoal.create(content: professional_goal_subgoals.sample, goal_id: goal.id, complete: true)
	end

end

#PERSONAL GOALS
10.times do
	goal = Goal.new(content: personal_goal_content.sample, by_when: Faker::Date.between(Date.today, 10.years.from_now), private: false, user_id: rand(1..10), category_id: 3)

	rand(1..5).times do
		goal.tags << Tag.find(rand(1..15))
	end

	goal.save

	rand(1..4).times do
		goal.sub_goals << SubGoal.create(content: personal_goal_subgoals.sample, goal_id: goal.id, complete: false)
	end

	rand(1..4).times do
		goal.sub_goals << SubGoal.create(content: personal_goal_subgoals.sample, goal_id: goal.id, complete: true)
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
