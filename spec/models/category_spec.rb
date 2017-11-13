require 'rails_helper'

describe Category do
	before(:each) do 
		Category.create(name: "Health")
		Category.create(name: "Career")
		Category.create(name: "Personal")
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

	let(:categories) { Category.all }

	let(:health_category) { Category.first }
	let(:career_category) { Category.second }
	let(:personal_category) { Category.third }

	it 'has three categories' do
		expect(categories.count).to eq 3
	end

	it 'returns a collection of categories' do
		categories.each { |catergory| expect(category).to be_instance_of(Category) }
	end

	describe "catergory's association with goals" do
		it 'has a collection of goals' do
			health_category.goals.each { |goal| expect(goal).to be_instance_of(Goal) } 
		end

		it 'includes each goal' do
			expect(health_category.goals.include?(Goal.first)).to be true
			expect(health_category.goals.include?(Goal.second)).to be true
			expect(health_category.goals.include?(Goal.third)).to be true
		end
	end
end
