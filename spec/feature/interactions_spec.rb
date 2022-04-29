require 'rails_helper'
require 'faker'
RSpec.describe('updating user information', type: :feature) do
  let(:new_values) do
    {
      birthdate: Faker::Date.in_date_period(year: 1999),
      major: Faker::Educator.subject,
      bio: Faker::ChuckNorris.fact
    }
  end

  it 'default values' do
    visit user_google_oauth2_omniauth_authorize_path
    visit '/'
    expect(page).to(have_text('Welcome back'))
    expect(page).to(have_text('No Birthdate Given'))
    expect(page).to(have_text('No Bio Given'))
  end

  it 'updated values' do
    visit user_google_oauth2_omniauth_authorize_path
    visit '/'
    expect(page).to(have_text('Welcome back'))
    expect(page).to(have_text('No Birthdate Given'))
    expect(page).to(have_text('No Bio Given'))
    visit edit_user_session_path
    fill_in 'Birthdate', with: new_values[:birthdate]
    fill_in 'Major', with: new_values[:major]
    fill_in 'Bio', with: new_values[:bio]
    click_on 'commit'
    expect(page).to(have_http_status(:ok))
    expect(page).to(have_text('Welcome back'))
    expect(page).to(have_text(new_values[:bio]))
  end

  it 'updated values admin' do
    visit user_google_oauth2_omniauth_authorize_path
    lmsa_make_admin
    visit '/'
    expect(page).to(have_text('Welcome back'))
    expect(page).to(have_text('No Birthdate Given'))
    expect(page).to(have_text('No Bio Given'))
    visit edit_user_session_path
    fill_in 'Birthdate', with: new_values[:birthdate]
    fill_in 'Major', with: new_values[:major]
    fill_in 'Bio', with: new_values[:bio]
    click_on 'commit'
    expect(page).to(have_http_status(:ok))
    expect(page).to(have_text('Welcome back'))
    expect(page).to(have_text(new_values[:bio]))
  end
end

RSpec.describe('visiting admin root path', type: :feature) do
  it 'as non-admin' do
    visit user_google_oauth2_omniauth_authorize_path
    visit admin_root_path
    # visit '/home/adminDash'
    expect(page).to(have_http_status(:ok))
  end

  it 'as admin' do
    visit user_google_oauth2_omniauth_authorize_path
    lmsa_make_admin
    visit admin_root_path
    # visit '/home/adminDash'
    expect(page).to(have_http_status(:ok))
  end
end

RSpec.describe('visiting leaderboard page', type: :feature) do
  it 'no points' do
    visit user_google_oauth2_omniauth_authorize_path
    lmsa_make_admin
    visit myhistory_points_leaderboard_path
    expect(page).to(have_http_status(:ok))
    expect(page).to(have_text('My Points: 0'))
  end
end

RSpec.describe('visiting event history page', type: :feature) do
  it 'no points' do
    visit user_google_oauth2_omniauth_authorize_path
    lmsa_make_admin
    visit event_hists_path
    expect(page).to(have_http_status(:ok))
  end
end

RSpec.describe('visiting event page', type: :feature) do
  it 'no points' do
    visit user_google_oauth2_omniauth_authorize_path
    lmsa_make_admin
    visit events_path
    expect(page).to(have_http_status(:ok))
  end
end

RSpec.describe('visiting point history page', type: :feature) do
  it 'no points' do
    visit user_google_oauth2_omniauth_authorize_path
    lmsa_make_admin
    visit poin_events_path
    expect(page).to(have_http_status(:ok))
  end
end

RSpec.describe('visiting referrals page', type: :feature) do
  it 'no points' do
    visit user_google_oauth2_omniauth_authorize_path
    lmsa_make_admin
    visit referrals_path
    expect(page).to(have_http_status(:ok))
  end
end

RSpec.describe('visiting info page', type: :feature) do
  it 'no points' do
    visit user_google_oauth2_omniauth_authorize_path
    lmsa_make_admin
    visit home_info_path
    expect(page).to(have_http_status(:ok))
  end
end

RSpec.describe('creating new announcement', type: :feature) do
  it 'not admin' do
    visit user_google_oauth2_omniauth_authorize_path
    visit announcements_path
    skip('add assertions for non-admin announcement interaction')
  end

  it 'admin' do
    visit user_google_oauth2_omniauth_authorize_path
    lmsa_make_admin
    visit announcements_path
    expect(page).to(have_http_status(:ok))
    click_on 'New Announcement'
    fill_in 'Name', with: 'Test Announcement'
    #fill_in 'Rich_Description', with: Faker::ChuckNorris.fact
    find_field(id: "announcement_Rich_Description_trix_input_announcement", type: :hidden).set(Faker::ChuckNorris.fact)
    click_on 'Announce'
    expect(page).to(have_text('Announcement was successfully created'))
    visit announcements_path
    click_on 'Delete'
    expect(page).to(have_text('Announcement was successfully destroyed'))
  end
end

RSpec.describe('creating new referral', type: :feature) do
  let(:ref_vals) do
    {
      first: Faker::Name.first_name,
      last: Faker::Name.last_name,
      email: Faker::Internet.email
    }
  end
  let(:prof_ref_vals) do
    {
      first: Faker::Name.first_name,
      last: Faker::Name.last_name,
      email: Faker::Internet.email
    }
  end

  it 'non professional' do
    visit user_google_oauth2_omniauth_authorize_path
    visit referrals_path
    expect(page).to(have_http_status(:ok))
    click_on 'New Referral'
    fill_in 'referral_guest_first_name', with: ref_vals[:first]
    fill_in 'referral_guest_last_name', with: ref_vals[:last]
    fill_in 'referral_email', with: ref_vals[:email]
    click_on 'Submit'
    expect(page).to(have_text(ref_vals[:first]))
    click_on 'New Referral'
    fill_in 'referral_guest_first_name', with: Faker::Name.first_name
    fill_in 'referral_guest_last_name', with: Faker::Name.last_name
    fill_in 'referral_email', with: Faker::Internet.email
    click_on 'Submit'
    click_on 'New Referral'
    fill_in 'referral_guest_first_name', with: Faker::Name.first_name
    fill_in 'referral_guest_last_name', with: Faker::Name.last_name
    fill_in 'referral_email', with: Faker::Internet.email
    click_on 'Submit'
    click_on 'New Referral'
    fill_in 'referral_guest_first_name', with: Faker::Name.first_name
    fill_in 'referral_guest_last_name', with: Faker::Name.last_name
    fill_in 'referral_email', with: Faker::Internet.email
    click_on 'Submit'
    expect(page).to(have_text('referral limit'))
  end

  it 'medical professional approved' do
    visit user_google_oauth2_omniauth_authorize_path
    visit referrals_path
    click_on 'New Referral'
    fill_in 'referral_guest_first_name', with: prof_ref_vals[:first]
    fill_in 'referral_guest_last_name', with: prof_ref_vals[:last]
    fill_in 'referral_email', with: prof_ref_vals[:email]
    select('Yes', from: 'referral_medical_prof')
    click_on 'Submit'
    expect(page).to(have_text('Pending'))
    lmsa_make_admin
    visit admin_approve_path
    expect(page).to(have_http_status(:ok))
    expect(page).to(have_text(prof_ref_vals[:email]))
    visit edit_referral_path(Referral.where(guest_first_name: prof_ref_vals[:first]).ids)
    select('Yes', from: 'referral_admin_approved')
    click_on 'commit'
    expect(page).to(have_text('successfully updated'))
    visit referrals_path
    expect(page).to(have_text('approved'))
  end

  it 'medical professional rejected' do
    visit user_google_oauth2_omniauth_authorize_path
    visit referrals_path
    click_on 'New Referral'
    fill_in 'referral_guest_first_name', with: prof_ref_vals[:first]
    fill_in 'referral_guest_last_name', with: prof_ref_vals[:last]
    fill_in 'referral_email', with: prof_ref_vals[:email]
    select('Yes', from: 'referral_medical_prof')
    click_on 'Submit'
    expect(page).to(have_text('Pending'))
    lmsa_make_admin
    visit admin_approve_path
    expect(page).to(have_http_status(:ok))
    expect(page).to(have_text(prof_ref_vals[:email]))
    visit edit_referral_path(Referral.where(guest_first_name: prof_ref_vals[:first]).ids)
    select('No', from: 'referral_admin_approved')
    click_on 'commit'
    expect(page).to(have_text('successfully updated'))
    visit referrals_path
    expect(page).to(have_text('Rejected'))
  end
end

RSpec.describe('creating new event', type: :feature) do
  let(:event_vals) do
    {
      event_name: 'Meeting',
      e_type: 'General Meeting',
      event_date: Faker::Date.forward(days: 99),
      description: Faker::ChuckNorris.fact,
      virtual: false,
      password: Faker::Internet.password,
      meeting_link: Faker::Internet.url,
      signin_time: :event_date,
      point_val: Faker::Number.number(digits: 3),
      graphics: Faker::Internet.url,
      total_event_hr: Faker::Number.decimal(l_digits: 2)
    }
  end

  it 'as non-admin' do
    visit user_google_oauth2_omniauth_authorize_path
    skip('add assertions for non-admin event interaction')
  end

  it 'as admin' do
    visit user_google_oauth2_omniauth_authorize_path
    lmsa_make_admin
    visit new_event_path
    fill_in 'event_event_name', with: event_vals[:event_name]
    select 'General Meeting', from: 'event_e_type'
    fill_in 'event_description', with: event_vals[:description]
    fill_in 'event_password', with: event_vals[:password]
    fill_in 'event_meeting_link', with: event_vals[:meeting_link]
    fill_in 'event_point_val', with: event_vals[:point_val]
    fill_in 'event_graphics', with: event_vals[:graphics]
    fill_in 'event_total_event_hr', with: event_vals[:total_event_hr]
    click_on 'Submit'
    expect(page).to(have_text('successfully created'))
    click_on 'Enable Sign In'
    lmsa_make_non_admin
    visit events_path
    # puts page.body
    visit event_path(Event.where(event_name: event_vals[:event_name]).ids)
    click_on 'Sign In'
    fill_in 'password', with: event_vals[:password]
    click_on 'Sign In'
    expect(page).to(have_text('You are signed in'))
    visit event_hists_path
    expect(page).to(have_text(event_vals[:event_name]))
  end
end
