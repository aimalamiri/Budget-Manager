require_relative '../rails_helper'

RSpec.describe 'Categories Page', type: :system do
  before :all do
    User.create(name: 'user 1', email: 'user1@test.com', password: 'password').encrypted_password
    @user = User.last
    @category = Category.create(name: 'Car', icon: 'fa-car', user: @user)
    sign_in @user
  end

  it 'has the page title' do
    visit '/'
    expect(page).to have_content(@category.name)
  end
end
