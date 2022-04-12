require 'rails_helper'
require 'faker'
RSpec.describe('authenicating as user', type: :feature) do
  it 'successful sign in' do
    visit '/'
    expect(page).to(have_text('Sign in with Google'))
    visit user_google_oauth2_omniauth_authorize_path
    expect(page).to(have_text('Successfully authenticated from Google account.'))
    # fill_in 'Birthdate', with: Faker::Date.in_date_period(year: 1999)
    # fill_in 'Major', with: Faker::Educator.degree
    # fill_in 'Bio', with: Faker::ChuckNorris.fact
    click_on 'Skip'
    expect(page).to(have_text('Welcome back'))
    visit '/'
  end

  it 'successful sign out' do
    visit '/'
    expect(page).to(have_text('Sign in with Google'))
    visit user_google_oauth2_omniauth_authorize_path
    expect(page).to(have_text('Successfully authenticated from Google account.'))
    # fill_in 'Birthdate', with: Faker::Date.in_date_period(year: 1999)
    # fill_in 'Major', with: Faker::Educator.degree
    # fill_in 'Bio', with: Faker::ChuckNorris.fact
    click_on 'Skip'
    expect(page).to(have_text('Welcome back'))
    click_on 'Sign Out'
    expect(page).to(have_text('Sign in with Google'))
    visit user_google_oauth2_omniauth_authorize_path
    expect(page).to(have_text('Welcome back'))
  end
  # scenario 'unsuccessful authentication' do
  # before do
  # OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials
  # end
  # visit '/'
  # expect(page).to have_text("Sign in with Google")
  # visit user_google_oauth2_omniauth_authorize_path
  # expect(page).to have_text("is not authorized")
  # end
end

RSpec.describe('authenicating as admin', type: :feature) do
  it 'successful sign in' do
    visit '/'
    expect(page).to(have_text('Sign in with Google'))
    visit user_google_oauth2_omniauth_authorize_path
    expect(page).to(have_text('Successfully authenticated from Google account.'))
    click_on 'Skip'
    click_on 'Sign Out'
    User.where(uid: 1).update(admin: true)
    expect(page).to(have_text('Sign in with Google'))
    visit user_google_oauth2_omniauth_authorize_path
    expect(page).to(have_text('Welcome back Admin'))
    expect(page).to(have_text('Approval List'))
  end

  it 'successful sign out' do
    visit '/'
    expect(page).to(have_text('Sign in with Google'))
    visit user_google_oauth2_omniauth_authorize_path
    expect(page).to(have_text('Successfully authenticated from Google account.'))
    click_on 'Skip'
    click_on 'Sign Out'
    User.where(uid: 1).update(admin: true)
    expect(page).to(have_text('Sign in with Google'))
    visit user_google_oauth2_omniauth_authorize_path
    expect(page).to(have_text('Welcome back Admin'))
    expect(page).to(have_text('Approval List'))
    click_on 'Sign Out'
    expect(page).to(have_text('Sign in with Google'))
  end
end

RSpec.describe('dev feature', type: :feature) do
  it 'make admin button' do
    visit user_google_oauth2_omniauth_authorize_path
    visit '/'
    click_on 'Make me an admin'
    User.where(uid: 1).where(admin: true).should(exist)
    click_on 'Make me a normal user'
    User.where(uid: 1).where(admin: false).should(exist)
  end
end
