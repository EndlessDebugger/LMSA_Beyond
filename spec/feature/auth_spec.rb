require 'rails_helper'
require 'faker'
RSpec.describe 'authenicating as user', type: :feature do
  scenario 'successful sign in' do
    visit '/'
    expect(page).to have_text("Sign in with Google")
    visit user_google_oauth2_omniauth_authorize_path
    expect(page).to have_text("Successfully authenticated from Google account.")
    #fill_in 'Birthdate', with: Faker::Date.in_date_period(year: 1999)
    #fill_in 'Major', with: Faker::Educator.degree
    #fill_in 'Bio', with: Faker::ChuckNorris.fact
    click_on 'Sign Up'
    expect(page).to have_text("Welcome back")
  end
  scenario 'successful sign out' do
    visit '/'
    expect(page).to have_text("Sign in with Google")
    visit user_google_oauth2_omniauth_authorize_path
    expect(page).to have_text("Successfully authenticated from Google account.")
    #fill_in 'Birthdate', with: Faker::Date.in_date_period(year: 1999)
    #fill_in 'Major', with: Faker::Educator.degree
    #fill_in 'Bio', with: Faker::ChuckNorris.fact
    click_on 'Sign Up'
    expect(page).to have_text("Welcome back")
    click_on 'Sign Out'
    expect(page).to have_text("Sign in with Google")
    visit user_google_oauth2_omniauth_authorize_path
    expect(page).to have_text("Welcome back")
  end
  #scenario 'unsuccessful authentication' do
    #before do
      #OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials
    #end
    #visit '/'
    #expect(page).to have_text("Sign in with Google")
    #visit user_google_oauth2_omniauth_authorize_path
    #expect(page).to have_text("is not authorized")
  #end
end
RSpec.describe 'authenicating as admin', type: :feature do
  scenario 'successful sign in' do
    visit '/'
    expect(page).to have_text("Sign in with Google")
    visit user_google_oauth2_omniauth_authorize_path
    expect(page).to have_text("Successfully authenticated from Google account.")
    click_on 'Sign Up'
    click_on 'Sign Out'
    User.where(uid: 1).update(admin: true)
    expect(page).to have_text("Sign in with Google")
    visit user_google_oauth2_omniauth_authorize_path
    expect(page).to have_text("Admin Dashboard")
    expect(page).to have_text("Approval List")
  end
  scenario 'successful sign out' do
    visit '/'
    expect(page).to have_text("Sign in with Google")
    visit user_google_oauth2_omniauth_authorize_path
    expect(page).to have_text("Successfully authenticated from Google account.")
    click_on 'Sign Up'
    click_on 'Sign Out'
    User.where(uid: 1).update(admin: true)
    expect(page).to have_text("Sign in with Google")
    visit user_google_oauth2_omniauth_authorize_path
    expect(page).to have_text("Admin Dashboard")
    expect(page).to have_text("Approval List")
    click_on 'Sign Out'
    expect(page).to have_text("Sign in with Google")
  end
end
