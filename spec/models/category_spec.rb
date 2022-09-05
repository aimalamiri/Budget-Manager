require_relative '../rails_helper'

RSpec.describe 'Category', type: :model do
  before :each do
    @user = User.new(name: 'Aimal')
    @category = Category.new(name: 'Books', icon: 'fa-books', user: @user)
    @category.save!
  end

  it 'name is required' do
    @category.name = ''
    expect(@category).to_not be_valid
  end
end
