require 'rails_helper'

describe Category do
	before(:each) do 
		Category.create(name: "Health")
		Category.create(name: "Career")
		Category.create(name: "Personal")
	end

	let(:health) { Category.first }
	let(:career) { Category.second }
	let(:personal) { Category.third }

	it 'has three categories' do
		expect(Category.all.count).to eq 3
	end

end
