RSpec.describe 'Entities', type: :request do
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
    get group_entities_path(@group)
    expect(response).to render_template('index')
  end

  it 'Get 200 status' do
    get group_entities_path(@group)
    expect(response).to have_http_status(200)
  end
end
