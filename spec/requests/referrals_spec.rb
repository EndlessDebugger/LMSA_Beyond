require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe('/referrals', type: :request) do
  before do
    lmsa_sign_in
    lmsa_make_admin
  end
  # let(:user) { create(:user) }
  # This should return the minimal set of attributes required to create a valid
  # Referral. As you add validations to Referral, be sure to
  # adjust the attributes here as well.

  let(:valid_attributes) do
    {
      old_member: 1,
      guest_first_name: Faker::Name.first_name,
      guest_last_name: Faker::Name.last_name,
      medical_prof: false,
      email: Faker::Internet.email,
      date_referred: Date.today
    }
  end

  let(:invalid_attributes) do
    # skip('Add a hash of attributes invalid for your model')
    {
      old_member: nil,
      guest_first_name: nil,
      guest_last_name: nil,
      medical_prof: nil,
      email: nil,
      date_referred: nil,
      admin_approved: nil
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Referral.create!(valid_attributes)
      get referrals_url
      expect(response).to(be_successful)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      referral = Referral.create!(valid_attributes)
      get referral_url(referral)
      expect(response).to(be_successful)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_referral_url
      expect(response).to(be_successful)
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      referral = Referral.create!(valid_attributes)
      get edit_referral_url(referral)
      expect(response).to(be_successful)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Referral' do
        expect do
          post(referrals_url, params: { referral: valid_attributes })
        end.to(change(Referral, :count).by(1))
      end

      it 'redirects to the created referral' do
        post referrals_url, params: { referral: valid_attributes }
        # expect(response).to redirect_to(referral_url(Referral.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Referral' do
        expect do
          post(referrals_url, params: { referral: invalid_attributes }, as: :json)
        end.to(change(Referral, :count).by(0))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          old_member: 1,
          guest_first_name: Faker::Name.first_name,
          guest_last_name: Faker::Name.last_name,
          medical_prof: false,
          email: Faker::Internet.email,
          date_referred: Date.today
        }
      end

      it 'updates the requested referral' do
        referral = Referral.create!(valid_attributes)
        patch referral_url(referral), params: { referral: new_attributes }, as: :json
        referral.reload
        # skip('Add assertions for updated state')
        expect(response.body).to(include(new_attributes[:old_member].to_s))
        expect(response.body).to(include(new_attributes[:new_member].to_s))
        expect(response.body).to(include(new_attributes[:guest_first_name].to_s))
        expect(response.body).to(include(new_attributes[:guest_last_name].to_s))
        expect(response.body).to(include(new_attributes[:email].to_s))
      end

      it 'updates referral value' do
        referral = Referral.create!(valid_attributes)
        patch referral_url(referral), params: { referral: new_attributes }, as: :json
        referral.reload
        # expect(response).to redirect_to(referral_url(referral))
        expect(response).to(be_successful)
      end
    end

    context 'with invalid parameters' do
      it 'does not update referral value' do
        referral = Referral.create!(valid_attributes)
        patch referral_url(referral), params: { referral: invalid_attributes }, as: :json
        expect(response).not_to(be_successful)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested referral' do
      referral = Referral.create!(valid_attributes)
      expect do
        delete(referral_url(referral))
      end.to(change(Referral, :count).by(-1))
    end

    it 'redirects to the referrals list' do
      referral = Referral.create!(valid_attributes)
      delete referral_url(referral)
      expect(response).to(redirect_to("/officers/approval_list"))
    end
  end
end
