require_relative '../rails_helper'

RSpec.describe 'Home Page', type: :system do
  it 'has the page title' do
    visit '/'
    expect(page).to have_content('Manage your financial transactions')
  end
end
