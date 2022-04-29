class ReferralsController < ApplicationController
  before_action :set_referral, only: %i[show edit update destroy]
  rescue_from ActiveRecord::RecordNotUnique, with: :error_render_method

  def error_render_method
    redirect_to(referrals_path, { alert: 'Duplicate referrals are not allowed' })
  end

  # GET /referrals or /referrals.json
  def index
    @referrals = Referral.all
  end

  # GET /referrals/1 or /referrals/1.json
  def show; end

  # GET /referrals/new
  def new
    @referral = Referral.new
  end

  # GET /referrals/1/edit
  def edit
    redirect_to(referral_path) unless current_user.admin? || !@referral.admin_approved?
  end

  # POST /referrals or /referrals.json
  def create
    @referral = Referral.new(referral_params)
    if referralMax(current_user.id) && !@referral.medical_prof?
      redirect_to(referrals_path, { alert: 'You\'ve reached your friend referral limit, you can only refer medical professionals for now' })

    else
      respond_to do |format|
        if @referral.save

          message = if @referral.medical_prof == true
                      'Referral was successfully created. You will recieve the points once an admin approves it.'
                    else
                      'Referral was successfully created. You will recieve the points once your friend signs into this website.'
                    end

          format.html { redirect_to(referrals_path, notice: message.to_s) }
          format.json { render(:show, status: :created, location: @referral) }

        else
          format.html { render(:new, status: :unprocessable_entity) }
          format.json { render(json: @referral.errors, status: :unprocessable_entity) }

        end
      end
    end
  end

  # PATCH/PUT /referrals/1 or /referrals/1.json
  def update
    respond_to do |format|
      if @referral.update(referral_params)

        if referral_params[:admin_approved] && referral_params[:medical_prof]
          val = 1
          ref = Point.find_by(name: 'Professional Referral')
          val = ref.val unless ref.nil?
          temp = PoinEvent.create!(user_id: referral_params[:old_member], balance: val || 3, date: DateTime.now,
                                   description: 'You referred professional: x y using email: z'.gsub(/[xyz]/, 'x' => referral_params[:guest_first_name], 'y' => referral_params[:guest_last_name], 'z' => referral_params[:email]),
                                   admin_award_id: current_user.id
          )

          @referral.update_attribute(:poin_events_id, temp.id)
        end

        format.html { redirect_to(referral_url(@referral), notice: 'Referral was successfully updated.') }
        format.json { render(:show, status: :ok, location: @referral) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @referral.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /referrals/1 or /referrals/1.json
  def destroy
    temp = PoinEvent.find_by(id: @referral.poin_events_id)

    @referral.destroy!

    PoinEvent.destroy(@referral.poin_events_id) if temp.present?

    respond_to do |format|
      if current_user.admin
        format.html { redirect_to(admin_approve_path, notice: 'Referral was successfully deleted.') }
        format.json { head(:no_content) }
      else
        format.html { redirect_to(referrals_url, notice: 'Referral was successfully deleted.') }
        format.json { head(:no_content) }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_referral
    @referral = Referral.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def referral_params
    params.require(:referral).permit(:old_member, :guest_first_name, :guest_last_name, :medical_prof,
                                     :email, :date_referred, :admin_approved
    )
  end

  def referralMax(id)
    # This doesn't account for if the referral was in a previous semester, as the client wants the system to reset every semester
    (Referral.where(old_member: id).where(medical_prof: false).count > 2)
  end
end
