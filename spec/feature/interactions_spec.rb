require 'rails_helper'
require 'faker'
#RSpec.describe 'authenicating as user', type: :feature do
  #scenario 'successful sign in' do
    #visit '/'
    #expect(page).to have_text("Sign in with Google")
    #visit user_google_oauth2_omniauth_authorize_path
    #expect(page).to have_text("Successfully authenticated from Google account.")
    ##fill_in 'Birthdate', with: Faker::Date.in_date_period(year: 1999)
    ##fill_in 'Major', with: Faker::Educator.degree
    ##fill_in 'Bio', with: Faker::ChuckNorris.fact
    #click_on 'Sign Up'
    #expect(page).to have_text("Welcome back")
  #end
  #scenario 'successful sign out' do
    #visit '/'
    #expect(page).to have_text("Sign in with Google")
    #visit user_google_oauth2_omniauth_authorize_path
    #expect(page).to have_text("Successfully authenticated from Google account.")
    ##fill_in 'Birthdate', with: Faker::Date.in_date_period(year: 1999)
    ##fill_in 'Major', with: Faker::Educator.degree
    ##fill_in 'Bio', with: Faker::ChuckNorris.fact
    #click_on 'Sign Up'
    #expect(page).to have_text("Welcome back")
    #click_on 'Sign Out'
    #expect(page).to have_text("Sign in with Google")
  #end
  ##scenario 'unsuccessful authentication' do
    ##before do
      ##OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials
    ##end
    ##visit '/'
    ##expect(page).to have_text("Sign in with Google")
    ##visit user_google_oauth2_omniauth_authorize_path
    ##expect(page).to have_text("is not authorized")
  ##end
#end
RSpec.describe 'updating user information', type: :feature do
  let(:new_values) do
    {
      birthdate: Faker::Date.in_date_period(year: 1999),
      major: Faker::Educator.subject,
      bio: Faker::ChuckNorris.fact
    }
  end
  scenario 'default values' do
    visit '/'
    expect(page).to have_text("Sign in with Google")
    visit user_google_oauth2_omniauth_authorize_path
    expect(page).to have_text("Successfully authenticated from Google account.")
    click_on 'Sign Up'
    expect(page).to have_text("Welcome back")
    expect(page).to have_text("No Birthdate Given")
    expect(page).to have_text("No Bio Given")
  end
  scenario 'updated values' do
    visit '/'
    expect(page).to have_text("Sign in with Google")
    visit user_google_oauth2_omniauth_authorize_path
    expect(page).to have_text("Successfully authenticated from Google account.")
    click_on 'Sign Up'
    expect(page).to have_text("Welcome back")
    expect(page).to have_text("No Birthdate Given")
    expect(page).to have_text("No Bio Given")
    visit edit_user_session_path
    fill_in 'Birthdate', with: new_values[:birthdate]
    fill_in 'Major', with: new_values[:major]
    fill_in 'Bio', with: new_values[:bio]
    click_on 'Sign Up'
    expect(page).to have_text("Welcome back")
    expect(page).to have_text(new_values[:bio])
  end

end
RSpec.describe 'visiting leaderboard page', type: :feature do
  scenario 'no points' do
    visit '/'
    expect(page).to have_text("Sign in with Google")
    visit user_google_oauth2_omniauth_authorize_path
    expect(page).to have_text("Successfully authenticated from Google account.")
    click_on 'Sign Up'
    visit myhistory_points_leaderboard_path
    expect(page).to have_text("My Points: 0")
  end
end
