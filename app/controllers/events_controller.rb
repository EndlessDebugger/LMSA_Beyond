class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show; end

  # GET /events/new
  def new
    redirect_to events_path unless current_user.admin?
    @event = Event.new
  end

  # GET /events/1/edit
  def edit; end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sign_in_event
    event_id = params[:event_id]
    password = params[:password]
    user_id = params[:user_id]
    sign_in = params[:sign_in]
    point_recv = params[:point_recv]
    new_event_hist_params = {:event_id => event_id, :user_id => user_id, :sign_in => sign_in, :point_recv => point_recv}

    event = Event.find(event_id)
    event_hist = EventHist.find_by(event_id: event_id, user_id: user_id)
    if event_hist.present?
      redirect_to event_hists_path, 
      notice: "You already signed in!"
    else 
      if event.password == password
        new_event_hist = EventHist.new(new_event_hist_params)
        new_event_hist.save

        if !current_user.active_mem && (current_user.activeMem_Check >= 100)
          User.find_by(id:user_id).update_attribute(:active_mem, true)
        end

        redirect_to event_hist_url(new_event_hist),
        notice: 'You are signed in to the event!'
      else
        redirect_to event_url(event_id),
        alert: "Wrong Password!"
      end
    end


  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:event_name, :e_type, :event_date, :description, :event_creator, :signin_time,
                                  :virtual, :password, :meeting_link, :point_val, :graphics, :total_event_hr, :enable_sign_in, :active_mem)
  end

end