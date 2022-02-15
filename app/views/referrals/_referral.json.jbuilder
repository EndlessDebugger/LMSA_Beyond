json.extract! referral, :id, :old_member, :new_member, :guest_first_name, :guest_last_name, :medical_prof, :email, :date_referred, :admin_approved, :created_at, :updated_at
json.url referral_url(referral, format: :json)
