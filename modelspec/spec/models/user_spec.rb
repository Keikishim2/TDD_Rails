require 'rails_helper'

RSpec.describe User, type: :model do
  # this is our control
  context "with valid attributes" do
  	it "should save" do
  		user = User.new(
  				first_name: 'shane',
  				last_name: 'chang',
  				email: 'schang@codingdojo.com'
  			)
  		expect(user).to be_valid
  	end
  end
  context "with invalid attributes" do
  	it "should be invalid if first_name field is blank" do 
  		user = User.new(
  				first_name: '',
  				last_name: 'chang',
  				email: 'schang@codingdojo.com'
  			)
  		expect(user).to be_invalid
  	end
  	it "shoul be invalid if last_name field is blank" do
  		user = User.new(
  				first_name: 'shane',
  				last_name: '',
  				email: 'schang@codingdojo.com'
  			)
  		expect(user).to be_invalid
  	end
  	it "should be invalid if email already exists" do
  		user = User.new(
  				first_name: 'michael',
  				last_name: 'choi',
  				email: 'mchoi@codingdojo.com'
  			)
      user.save
  		user2 = User.new(
  				first_name: 'michael',
  				last_name: 'choi',
  				email: 'mchoi@codingdojo.com'
  			)
  		expect(user2).to be_invalid
  	end
  	it "should show error if invalid email format" do
  		user = User.new(
  				first_name: 'michael',
  				last_name: 'choi',
  				email: 'mchoicom'
  			)
  		expect(user).to be_invalid
  	end
  end
end