class EventHistsController < ApplicationController
  before_action :set_event_hist, only: %i[ show edit update destroy ]

  # GET /event_hists or /event_hists.json
  def index
    @event_hists = EventHist.all
  end

  # GET /event_hists/1 or /event_hists/1.json
  def show
  end

  # GET /event_hists/new
  def new
    @event_hist = EventHist.new
  end

  # GET /event_hists/1/edit
  def edit
  end

  # POST /event_hists or /event_hists.json
  def create
    @event_hist = EventHist.new(event_hist_params)

    respond_to do |format|
      if @event_hist.save
        format.html { redirect_to event_hist_url(@event_hist), notice: "Event hist was successfully created." }
        format.json { render :show, status: :created, location: @event_hist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_hist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_hists/1 or /event_hists/1.json
  def update
    respond_to do |format|
      if @event_hist.update(event_hist_params)
        format.html { redirect_to event_hist_url(@event_hist), notice: "Event hist was successfully updated." }
        format.json { render :show, status: :ok, location: @event_hist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_hist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_hists/1 or /event_hists/1.json
  def destroy
    @event_hist.destroy

    respond_to do |format|
      format.html { redirect_to event_hists_url, notice: "Event hist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_hist
      @event_hist = EventHist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_hist_params
      params.require(:event_hist).permit(:event_id, :user_id, :sign_in, :point_recv)
    end
end
