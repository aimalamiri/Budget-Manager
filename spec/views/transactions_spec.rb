require_relative '../rails_helper'

RSpec.describe 'Transactions Page', type: :system do
  before :all do
    User.create(name: 'user 1', email: 'user1@test.com', password: 'password').encrypted_password
    @user = User.last
    @category = Category.create(name: "car#{rand(10_000)}", icon: 'fa-car', user: @user)
    @transaction = @category.records.create(name: 'fuel', amount: 11, user: @user)
  end

  before :each do
    sign_in @user
  end

  it 'has the transaction name' do
    visit category_transactions_path(@category.id)
    expect(page).to have_content(@transaction.name)
  end

  it 'has the transaction amount' do
    visit category_transactions_path(@category.id)
    expect(page).to have_content(@transaction.amount)
  end

  it 'returns the new transactions form page when the user clicks on the Add Transaction button' do
    visit category_transactions_path(@category.id)
    find('#new-transaction').click
    expect(page).to have_content('Record a new transaction')
  end
end
