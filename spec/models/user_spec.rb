require 'rails_helper'

describe User do
	let(:user) { User.new }
  
  before(:each) do
  	User.create(given_name: "Georgi", family_name: "Wiesel", username: "i_m_wiesel", email: "g.wiesel@email.org", password: "password")
  	User.create(given_name: "Frederick", family_name: "Wiesel", username: "f_m_wiesel", email: "f.wiesel@email.org", password: "password")
  	User.create(given_name: "Ronald", family_name: "Wiesel", username: "ron_wiesel", email: "r.wiesel@email.org", password: "password")
  	Category.create(name: "Health")
 		Goal.create(content: "I will have ripped abs", by_when: Date.new(2020, 2, 20), category_id: Category.first.id, user_id: User.first.id)
		Goal.create(content: "I will stop eating a whole box of cookies", by_when: Date.new(2019, 4, 20), category_id: Category.first.id, user_id: User.first.id)
		Goal.create(content: "I will start exercising more often", by_when: Date.new(2018, 1, 20), category_id: Category.first.id, user_id: User.first.id)
  end

  let(:users) { User.all }

  let(:goals) { Goal.all }

  let(:first_user) { User.first }

  xit 'returns a collection of users' do
  	expect(users.class).to eq(User::ActiveRecord_Relation)
  end

  describe "user's associations" do
  	xit 'has goals' do
  		expect(first_user.goals).to eq goals
  	end

  	xit 'includes each goal' do
  		expect(first_user.goals.include?(Goal.first)).to be true
  		expect(first_user.goals.include?(Goal.second)).to be true
  		expect(first_user.goals.include?(Goal.third)).to be true

  	end

  end
end
