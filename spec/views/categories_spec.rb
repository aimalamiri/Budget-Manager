require_relative '../rails_helper'

RSpec.describe 'Categories Page', type: :system do
  before :all do
    User.create(name: 'user 1', email: 'user1@test.com', password: 'password').encrypted_password
    @user = User.last
    @category = Category.create(name: "car#{rand(10_000)}", icon: 'fa-car', user: @user)
  end

  before :each do
    sign_in @user
  end

  it 'has the category name' do
    visit '/'
    expect(page).to have_content(@category.name)
  end

  it 'it redirects the new category page when the user clicks on add new category' do
    visit '/'
    find('#new-category').click
    expect(page).to have_content('Add a new Category')
  end
end
