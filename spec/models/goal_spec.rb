require 'rails_helper'

describe Goal do
	let(:goal) { Goal.new }

	before(:each) do
		Category.create(name: "Health")
		User.create(given_name: "Georgi", family_name: "Wiesel", username: "i_m_wiesel", email: "g.wiesel@email.org", password: "password")
		first_goal = Goal.new(content: "I will have ripped abs", by_when: Date.new(2020, 2, 20), category_id: Category.first.id, user_id: User.first.id)
		first_goal.tags << Tag.create(name: "body goals")
		first_goal.save
		second_goal = Goal.new(content: "I will stop eating a whole box of cookies", by_when: Date.new(2019, 4, 20), category_id: Category.first.id, user_id: User.first.id)
		second_goal.tags << Tag.create(name: "dieting")
		second_goal.save
		third_goal = Goal.new(content: "I will start exercising more often", by_when: Date.new(2018, 1, 20), category_id: Category.first.id, user_id: User.first.id)
		third_goal.tags << Tag.create(name: "exercising")
		third_goal.save
	end

	let(:category) { Category.first }
	let(:user) { User.first }

	let(:goals) { Goal.all }

	let(:first_goal) { Goal.first }
	let(:second_goal) { Goal.second }
	let(:third_goal) { Goal.third }

	it 'returns a collection of goals' do
		goals.each { |goal| expect(goal).to be_instance_of(Goal) }
	end

	describe "a goal's attributes" do
		it 'has content' do
			goal.content = 'I will live life to the fullest'
			expect(goal.content).to eq 'I will live life to the fullest'
		end

		it 'has a date by when it will be accomplished' do
			goal.by_when = Date.new(2019, 6, 28)
			expect(goal.by_when).to be_instance_of(Date)
		end
	end

	describe "a goal's validations" do
		it 'is valid when content is defined' do
			goal.content = 'I want to catch a fish and wish it luck in finding its son Nemo'
			expect(goal.errors[:content]).to be_empty
		end

		it 'is valid when a date by when the goal will be accomplished is defined' do
			goal.by_when = Date.new(3008, 3, 4)
			expect(goal.errors[:by_when]).to be_empty
		end

		it 'is valid when it is placed in a category' do
			goal.category = category
			expect(goal.errors[:category_id]).to be_empty
		end

		it 'is valid when it is tagged' do
			goal.tags << Tag.first
			expect(goal.errors[:tags]).to be_empty
		end
	end

	describe "a goal's associations" do
		it 'has a category' do
			expect(first_goal.category).to be_instance_of(Category)
		end

		it 'has a user' do
			expect(first_goal.user).to eq(user)
		end

		it 'has tags' do
			first_goal.tags.each { |tag| expect(tag).to be_instance_of(Tag) }
		end

		it 'includes each tag' do
			expect(first_goal.tags.include?(Tag.first)).to be true
			expect(second_goal.tags.include?(Tag.second)).to be true
			expect(third_goal.tags.include?(Tag.third)).to be true
		end

		it 'creates a GoalTag for each new tag' do
			expect(first_goal.tags.first.id).to eq GoalTag.first.tag_id
			expect(second_goal.tags.first.id).to eq GoalTag.second.tag_id
			expect(third_goal.tags.first.id).to eq GoalTag.third.tag_id
		end

		it 'has goal_tags' do
			first_goal.goal_tags.each { |goal_tag| expect(goal_tag).to be_instance_of(GoalTag) }
		end
	end
end
