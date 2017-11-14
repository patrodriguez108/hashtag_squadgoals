require 'rails_helper'

describe User do
	let(:user) { User.new }
  
  before(:each) do
  	User.create(given_name: "Georgi", family_name: "Wiesel", username: "i_m_wiesel", email: "g.wiesel@email.org", password: "password")
  	User.create(given_name: "Frederick", family_name: "Wiesel", username: "f_m_wiesel", email: "f.wiesel@email.org", password: "password")
  	User.create(given_name: "Ronald", family_name: "Wiesel", username: "ron_wiesel", email: "r.wiesel@email.org", password: "password")
  	Category.create(name: "Health")
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

  let(:users) { User.all }

  let(:first_user) { User.first }

  it 'returns a collection of users' do
    users.each { |user| expect(user).to be_instance_of(User) }
  end

  describe "user's attributes" do
    it 'has a given name' do
      user.given_name = 'Jarfle'
      expect(user.given_name).to eq 'Jarfle'
    end

    it 'has a family name' do
      user.family_name = 'Menendez'
      expect(user.family_name).to eq 'Menendez'
    end

    it 'has a full name' do
      user.given_name = 'Jarfle'
      user.family_name = 'Menendez'
      expect(user.full_name).to eq 'Jarfle Menendez'
    end

    it 'has a username' do
      user.username = 'jarflcopter'
      expect(user.username).to eq 'jarflcopter'
    end

    it 'has an e-mail address' do
      user.email = 'jarflcopter@hotmail.com'
      expect(user.email).to eq 'jarflcopter@hotmail.com'
    end

    it 'has a password stored' do
      user.password = 'jarflisdaman'
      expect(user.password_digest.exist?).to be true
    end
  end

  describe "user's associations" do
  	it 'has goals' do
  		first_user.goals.each { |goal| expect(goal).to be_instance_of(Goal) }
  	end

  	it 'includes each goal' do
  		expect(first_user.goals.include?(Goal.first)).to be true
  		expect(first_user.goals.include?(Goal.second)).to be true
  		expect(first_user.goals.include?(Goal.third)).to be true
  	end

  end
end
