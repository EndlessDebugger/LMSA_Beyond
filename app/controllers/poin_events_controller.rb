class PoinEventsController < ApplicationController
  before_action :set_poin_event, only: %i[show edit update destroy]

  # GET /poin_events or /poin_events.json
  def index
    @poin_events = PoinEvent.all
  end

  # GET /poin_events/1 or /poin_events/1.json
  def show; end

  # GET /poin_events/new
  def new
    redirect_to(poin_events_path) unless current_user.admin?
    @poin_event = PoinEvent.new
  end

  # GET /poin_events/1/edit
  def edit
    redirect_to(poin_events_path) unless current_user.admin?
  end

  # POST /poin_events or /poin_events.json
  def create
    user = User.find_by(email: poin_event_params[:email])
    if user.present?
      new_poin_event_params = {
        user_id: user[:id],
        balance: poin_event_params[:balance],
        description: poin_event_params[:description],
        admin_award_id: poin_event_params[:admin_award_id]
      }
      @poin_event = PoinEvent.new(new_poin_event_params)
      respond_to do |format|
        if @poin_event.save
          format.html { redirect_to(poin_event_url(@poin_event), notice: 'Point Award was successfully created.') }
          format.json { render(:show, status: :created, location: @poin_event) }
        else
          format.html { render(:new, status: :unprocessable_entity) }
          format.json { render(json: @poin_event.errors, status: :unprocessable_entity) }
        end
      end
    else 
      redirect_to(poin_events_path, alert: 'The email does not exist!')
    end

  end

  # PATCH/PUT /poin_events/1 or /poin_events/1.json
  def update
    redirect_to(poin_events_path) unless current_user.admin?
    user = User.find_by(email: poin_event_params[:email])
    if user.present?
      new_poin_event_params = {
        user_id: user[:id],
        balance: poin_event_params[:balance],
        description: poin_event_params[:description],
        admin_award_id: poin_event_params[:admin_award_id]
      }
      respond_to do |format|
        if @poin_event.update(new_poin_event_params)
          format.html { redirect_to(poin_event_url(@poin_event), notice: 'Point awardal was successfully updated.') }
          format.json { render(:show, status: :ok, location: @poin_event) }
        else
          format.html { render(:edit, status: :unprocessable_entity) }
          format.json { render(json: @poin_event.errors, status: :unprocessable_entity) }
        end
      end
    else
      redirect_to(poin_events_path, notice: 'The email does not exist!')
    end
  end

  # DELETE /poin_events/1 or /poin_events/1.json
  def destroy
    if current_user.admin?
      @poin_event.destroy!

      respond_to do |format|
        if current_user.admin
          format.html { redirect_to(poin_events_url, notice: 'Point history was successfully deleted.') }
          format.json { head(:no_content) }
        else
          format.html { redirect_to(poin_events_url, notice: 'Point history was successfully destroyed.') }
          format.json { head(:no_content) }
        end

      end
    else
      redirect_to(poin_events_url)
    end
  end


  def policyUpdate

    if current_user.admin

      if(policy_params[:general_event].present? && policy_params[:general_event] != Rails.configuration.points.general_event)
        Rails.configuration.points.general_event=policy_params[:general_event]
      end

      if(policy_params[:med_prof_ref].present? && policy_params[:med_prof_ref] != Rails.configuration.points.med_prof_ref)
        Rails.configuration.points.med_prof_ref=policy_params[:med_prof_ref]
      end

      if(policy_params[:merch].present? && policy_params[:merch] != Rails.configuration.points.merch)
        Rails.configuration.points.merch=policy_params[:merch]
      end

      if(policy_params[:social].present? && policy_params[:social] != Rails.configuration.points.social)
        Rails.configuration.points.social=policy_params[:social]
      end

      if(policy_params[:fundraiser].present? && policy_params[:fundraiser] != Rails.configuration.points.fundraiser)
        Rails.configuration.points.fundraiser=policy_params[:fundraiser]
      end
      
      if(policy_params[:volunteer].present? && policy_params[:volunteer] != Rails.configuration.points.volunteer)
        Rails.configuration.points.volunteer=policy_params[:volunteer]
      end
      
      if(policy_params[:referral].present? && policy_params[:referral] != Rails.configuration.points.referral)
        Rails.configuration.points.referral=policy_params[:referral]
      end
      
      if(policy_params[:opp].present? && policy_params[:opp] != Rails.configuration.points.opp)
        Rails.configuration.points.opp=policy_params[:opp]
      end

      if(policy_params[:smedia].present? && policy_params[:smedia] != Rails.configuration.points.smedia)
        Rails.configuration.points.smedia=policy_params[:smedia]
      end

      respond_to do |format|
        format.html { redirect_to(admin_root_path, notice: "Policy update successful") }
        format.json { head(:no_content) }
      end
    else
      redirect_to(root_path, alert: "You're not allowed to do this!") 
    end


  end

  def reset
    if current_user.admin
      # Poinevent.connection.truncate("poin_events")  
      Event.destroy_all
      EventHist.destroy_all
      PoinEvent.destroy_all
      Announcement.destroy_all
      Referral.destroy_all
      respond_to do |format|
        format.html { redirect_to(admin_root_path, notice: "Semester Reset Successful") }
        format.json { head(:no_content) }
      end
    else
      redirect_to(root_path, alert: "You're not allowed to do this!") 
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_poin_event
    @poin_event = PoinEvent.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def poin_event_params
    params.require(:poin_event).permit(:email, :user_id, :balance, :date, :description, :admin_award_id, :hours_attend)
  end

  def policy_params
    params.permit( :general_event, :med_prof_ref, :merch, :social, :fundraiser, :volunteer, :referral, :opp)
  end

  def reset_params
    params.permit(:new_date)
  end
end
