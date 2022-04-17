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
          format.html { redirect_to(poin_event_url(@poin_event), notice: 'Poin event was successfully created.') }
          format.json { render(:show, status: :created, location: @poin_event) }
        else
          format.html { render(:new, status: :unprocessable_entity) }
          format.json { render(json: @poin_event.errors, status: :unprocessable_entity) }
        end
      end
    else 
      redirect_to(poin_events_path, notice: 'The email does not exist!')
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
          format.html { redirect_to(poin_event_url(@poin_event), notice: 'Poin event was successfully updated.') }
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
        format.html { redirect_to(poin_events_url, notice: 'Poin event was successfully destroyed.') }
        format.json { head(:no_content) }
      end
    else
      redirect_to(poin_events_url)
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
end
