class PoinEventsController < ApplicationController
  before_action :set_poin_event, only: %i[ show edit update destroy ]

  # GET /poin_events or /poin_events.json
  def index
    @poin_events = PoinEvent.all
  end

  # GET /poin_events/1 or /poin_events/1.json
  def show
  end

  # GET /poin_events/new
  def new
    @poin_event = PoinEvent.new
  end

  # GET /poin_events/1/edit
  def edit
  end

  # POST /poin_events or /poin_events.json
  def create
    @poin_event = PoinEvent.new(poin_event_params)

    respond_to do |format|
      if @poin_event.save
        format.html { redirect_to poin_event_url(@poin_event), notice: "Poin event was successfully created." }
        format.json { render :show, status: :created, location: @poin_event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poin_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poin_events/1 or /poin_events/1.json
  def update
    respond_to do |format|
      if @poin_event.update(poin_event_params)
        format.html { redirect_to poin_event_url(@poin_event), notice: "Poin event was successfully updated." }
        format.json { render :show, status: :ok, location: @poin_event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poin_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poin_events/1 or /poin_events/1.json
  def destroy
    @poin_event.destroy

    respond_to do |format|
      format.html { redirect_to poin_events_url, notice: "Poin event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poin_event
      @poin_event = PoinEvent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def poin_event_params
      params.require(:poin_event).permit(:user_id, :balance, :date, :description, :admin_award_id, :hours_attend)
    end
end
