require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  before(:each) do
    @user = User.new(name: 'Fabien', email: 'fabienswift@gmail.com', password: '123456')
    @user.save
    @group = Group.new(name: 'Food',
                       icon: 'https://cdn-icons-png.flaticon.com/512/2819/2819194.png',
                       user: @user)
    @group.save
    sign_in(@user)
  end

  it 'show index template' do
    get groups_path
    expect(response).to render_template('index')
  end

  it 'show the correct text' do
    get groups_path
    expect(response.body).to include('Categories')
  end

  it 'Get 200 status' do
    get groups_path
    expect(response).to have_http_status(200)
  end
end