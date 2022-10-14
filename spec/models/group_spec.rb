require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.new(name: 'Fabien', email: 'fabienswift@gmail.com', password: '123456')
    @user.save
    @group = Group.new(name: 'Food',
                       icon: 'https://cdn-icons-png.flaticon.com/512/2819/2819194.png',
                       user: @user)
    @group.save
  end

  it 'requires name' do
    @group.name = nil
    expect(@group).to_not be_valid
  end
end
