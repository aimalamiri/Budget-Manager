require_relative '../rails_helper'

RSpec.describe 'Record', type: :model do
  before :each do
    @user = User.create(name: 'Aimal')
    @record = Record.new(name: 'Purchased a book', amount: 18, user: @user)
    @record.save!
  end

  it 'name must be present' do
    @record.name = nil
    expect(@record).to_not be_valid
  end

  it 'name length must be less then 255 characters' do
    @record.name = 'aaa'*255
    expect(@record).to_not be_valid
  end
end
