require 'rails_helper'

describe Goal do
	let(:goal) { Goal.new }

	before(:each) do
		Category.create(name: "Health")
		User.create(given_name: "Georgi", family_name: "Wiesel", username: "i_m_wiesel", email: "g.wiesel@email.org", password: "password")
		Goal.create(content: "I will have ripped abs", by_when: Date.new(2020, 2, 20), category_id: Category.first.id, user_id: User.first.id)
		Goal.create(content: "I will stop eating a whole box of cookies", by_when: Date.new(2019, 4, 20), category_id: Category.first.id, user_id: User.first.id)
		Goal.create(content: "I will start exercising more often", by_when: Date.new(2018, 1, 20), category_id: Category.first.id, user_id: User.first.id)
		Goal.first.tags << Tag.create(name: "body goals")
		Goal.second.tags << Tag.create(name: "dieting")
		Goal.third.tags << Tag.create(name: "exercising")
	end

	let(:category) { Category.first }
	let(:user) { User.first }

	let(:goals) { Goal.all }

	let(:first_goal) { Goal.first }
	let(:second_goal) { Goal.second }
	let(:third_goal) { Goal.third }

	xit 'returns a collection of goals' do
		expect(goals.class).to eq(Goal::ActiveRecord_Relation)
	end

	describe "a goal's associations" do
		xit 'has a category' do
			p first_goal
			expect(first_goal.category).to eq category
		end

		xit 'has a user' do
			expect(first_goal.user).to eq user
		end

		xit 'has tags' do

		end

		xit 'includes each tag' do
			expect(first_goal.tags.include?(Tag.first)).to be true
			expect(second_goal.tags.include?(Tag.second)).to be true
			expect(third_goal.tags.include?(Tag.third)).to be true
		end

		xit 'creates a GoalTag for each new tag' do
			expect(first_goal.tags.first.id).to eq GoalTag.first.tag_id
			expect(second_goal.tags.first.id).to eq GoalTag.second.tag_id
			expect(third_goal.tags.first.id).to eq GoalTag.third.tag_id
		end

		xit 'has goal_tags' do

		end
	end
end
