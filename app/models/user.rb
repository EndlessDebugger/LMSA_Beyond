class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :event_hists, dependent: :destroy
  has_many :poin_events, dependent: :destroy
  has_many :referrals, dependent: :destroy
  # validates :admin, presence: true
  validates :email, presence: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true

  def self.from_google(email:, first_name:, last_name:, full_name:, uid:, avatar_url:)
    # this check is not valid, google will determine if an address is a real google account
    # return nil unless email =~ /@gmail.com || @tamu.edu\z/
    # find_or_create_by(email: email)

    create_with(uid: uid, first_name: first_name, last_name: last_name, admin: false, avatar_url: avatar_url).find_or_create_by!(email: email)
  end

  def sum_points
    poin_events.where('user_id = ?', id).sum(:balance) + event_hists.where('user_id = ?', id).sum(:point_recv)
  end

  def bod
    if birthdate.present?
      birthdate.strftime('%m/%d/%Y')
    else
      'No Birthdate Given'
    end
  end

  def bioConfirmation
    bio.presence || 'No Bio Given'
  end

  def majorConfirmation
    major.presence || 'No Major Given'
  end

  def userReferrals
    referrals.where('oldmember = ?', id)
  end

  def counter
    User.count
  end

  def allowed
    val = false
    okay_emails = [
      'zli2018@tamu.edu', 'avalos672918@tamu.edu', 'dortizchaves@tamu.edu', 'nudodenko99@tamu.edu', 'alec_hubacher@tamu.edu', 'lanceabuan@tamu.edu',
      'HollandMcQ2@gmail.com ', 'subr809@tamu.edu', 'jhassmann@tamu.edu', 'yk7335@tamu.edu', 'mjmueller@tamu.edu'
    ]

    okay_emails.each do |x|
      val = true if x == email
    end
    val = true if Rails.env.test?
    val
  end

  def activeMem_Check
    @gen  = Event.where(e_type: Event.e_types[:general]).joins(:event_hists).where(event_hists: { user_id: id }).count
    @fun  = Event.where(e_type: Event.e_types[:fund]).joins(:event_hists).where(event_hists: { user_id: id }).count
    @vol  = Event.where(e_type: Event.e_types[:volunteer]).joins(:event_hists).where(event_hists: { user_id: id }).count

    puts('Gen: ' + @gen.to_s + ' fun:' + @fun.to_s + ' vol:' + @vol.to_s)

    (((@gen + @fun + @vol).to_f / 10).to_f * 100)
  end

  def get_gen
    @gen
  end

  def get_fun
    @fun
  end

  def get_vol
    @vol
  end

  def leaderboard
    count = 0
    @rank = 1

    @list = User.all.sort { |a, b| b.sum_points <=> a.sum_points }
    @list.each do |that_user|
      count += 1

      @rank = count if that_user.id == id
    end

    @list
  end

  def get_rank
    @rank
  end
end
