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
		it 'has a category' do
			expect(first_goal.category).to eq category
		end

		it 'has a user' do
			expect(first_goal.user).to eq user
		end
	end
end
