# require 'capybara/rspec'

RSpec.describe 'Sign in', type: :system do
  before :each do
    User.create(name: 'Julius')
  end

  it 'Sign In: Registered User, Valid username message' do
    visit '/login'

    within('#new_session') do
      fill_in 'Name', with: 'Julius'
    end

    sleep(3)
    click_button 'Sign In'

    sleep(3)
    expect(page).to have_content('you logged in succesfully')
  end

  it 'Sign In: Unregistered User, Invalid Username message' do
    visit '/login'

    within('#new_session') do
      fill_in 'Name', with: 'Notregistered'
    end

    sleep(3)
    click_button 'Sign In'

    sleep(3)
    expect(page).to have_content('Please Sign In or Sign Up if you don\'t have an account yet')
  end

  describe 'ADD: New Task page' do
    it 'Error: Authentication Warning' do
      visit new_expenditure_path
      sleep(3)

      expect(page).to have_content('To continue, please Sign In or Sign Up if you don\'t have an account')
    end
  end
end
