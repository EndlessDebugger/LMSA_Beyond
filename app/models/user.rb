class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :event_hists
  has_many :poin_events
  has_many :referrals
  #validates :admin, presence: true
  #validates :email, presence: true
  #validates :first_name, presence: true
  #validates :last_name, presence: true

  # def first_name
  #   self.full_name.blank? ? "" : self.full_name.split(" ")[0]
  # end

  # def last_name
  #   self.full_name.blank? ? "" : self.full_name.split(" ")[1]
  # end
  
  def self.from_google(email:, first_name:, last_name:, full_name:, uid:, avatar_url:)
    return nil unless email =~ /@gmail.com || @tamu.edu\z/
    # find_or_create_by(email: email)

    create_with(uid: uid, first_name: first_name, last_name: last_name, admin: false, avatar_url: avatar_url).find_or_create_by!(email: email)
  end

  def sum_points
    poin_events.where("user_id = ?", id).sum(:balance) + event_hists.where("user_id = ?", id).sum(:point_recv)
  end
    
  def getuser_points(userid)
    poin_events.where("user_id = ?", userid).sum(:balance) + event_hists.where("user_id = ?", userid).sum(:point_recv)
  end    

  def bod
      if birthdate.present?
        birthdate.strftime("%m/%d/%Y")
      else
        "No Birthdate Given"
      end
  end

  def bioConfirmation
    if bio.present?
      bio
    else
      "No Bio Given"
    end
  end

end
