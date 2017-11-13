require 'rails_helper'

describe Category do
	let(:category) { Category.new }

	before(:each) do 
		Category.create(name: "Health")
		Category.create(name: "Career")
		Category.create(name: "Personal")
		User.create(given_name: "Georgi", family_name: "Wiesel", username: "i_m_wiesel", email: "g.wiesel@email.org", password: "password")
		Goal.create(content: "I will have ripped abs", by_when: Date.new(2020, 2, 20), category_id: Category.first.id, user_id: User.first.id)
		Goal.create(content: "I will stop eating a whole box of cookies", by_when: Date.new(2019, 4, 20), category_id: Category.first.id, user_id: User.first.id)
		Goal.create(content: "I will start exercising more often", by_when: Date.new(2018, 1, 20), category_id: Category.first.id, user_id: User.first.id)
	end

	let(:categories) { Category.all }

	let(:health_category) { Category.first }
	let(:career_category) { Category.second }
	let(:personal_category) { Category.third }


	xit 'has three categories' do
		expect(categories.count).to eq 3
	end

	xit 'returns a collection of categories' do
		expect(categories.class).to eq(Category::ActiveRecord_Relation)
	end

	describe "catergory's association with goals" do

		xit 'has a collection of goals' do
			expect(health_category.goals.class).to eq(Goal::ActiveRecord_Associations_CollectionProxy)
		end

		xit 'includes each goal' do
			expect(health_category.goals.include?(Goal.first)).to be true
			expect(health_category.goals.include?(Goal.second)).to be true
			expect(health_category.goals.include?(Goal.third)).to be true
		end

	end

end
