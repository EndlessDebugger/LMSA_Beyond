class EventsController < ApplicationController
  # before_action :event_id
  before_action :set_event, only: %i[show edit update destroy]

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show; end

  # GET /events/new
  def new
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

    event = Event.find(event_id)
    if event.password == password
      redirect_to event_hists_path(:event_hist => {:event_id => @event.id, :user_id => current_user.id, :sign_in => true, :point_recv => @event.point_val}),
      notice: 'The sign in event is handled!'
    else
      flash.alert = "Wrong Password!"
    end


  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    # params.require(:event).permit(:event_name, :event_type, :event_date, :description, :event_creator,
    #                               :virtual, :password, :meeting_link, :start_time, :end_time, :point_val, :graphics, :total_event_hr,
    #                               :categories, :created_at)
    params.require(:event).permit(:event_name, :event_type, :event_date, :description, :event_creator,
                                  :virtual, :password, :meeting_link, :point_val, :graphics, :total_event_hr)
  end

  # def add_category
  #   @event = Event.find(params[:id])
  #   @category = Category.find(params[:category_id])

  #   @event.categories << @category #->> as to be two ActiveRecord objects
  # end

  # def find_resource
  #   scoped_collection.friendly.find(params[:id])
  # end

  # def event_id
  #   event_id: request.uuid
  # end

end