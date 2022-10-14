require 'rails_helper'

RSpec.describe Entity, type: :model do
  before(:each) do
    @user = User.new(name: 'Fabien', email: 'fabienswift@gmail.com', password: '123456')
    @user.save
    @group = Group.new(name: 'Food',
                       icon: 'https://cdn-icons-png.flaticon.com/512/2819/2819194.png',
                       user: @user)
    @group.save
    @entity = Entity.new(name: 'Burger', amount: 10, user: @user)
  end

  it 'requires name' do
    @entity.name = nil
    expect(@entity).to_not be_valid
  end

  it 'requires amount to be greater than 0' do
    @entity.amount = 0
    expect(@entity).to_not be_valid
  end

  it 'requires amount to be present' do
    @entity.amount = nil
    expect(@entity).to_not be_valid
  end
end