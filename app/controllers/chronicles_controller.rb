class ChroniclesController < ApplicationController
  before_action :set_chronicle, only: [:show, :edit, :update, :destroy]
  before_action :fill_selects, only: [:new, :create, :edit, :update]

  # GET /chronicles
  # GET /chronicles.json
  def index
    @chronicles = Chronicle.ordered.all
  end

  # GET /chronicles/1
  # GET /chronicles/1.json
  def show
  end

  # GET /chronicles/new
  def new
    @chronicle = Chronicle.new
  end

  # GET /chronicles/1/edit
  def edit
  end

  # POST /chronicles
  # POST /chronicles.json
  def create
    @chronicle = Chronicle.new(chronicle_params)

    respond_to do |format|
      if @chronicle.save
        format.html { redirect_to root_path(date: @chronicle.date), notice: 'Chronicle was successfully created.' }
        format.json { render action: 'show', status: :created, location: @chronicle }
      else
        format.html { render action: 'new' }
        format.json { render json: @chronicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chronicles/1
  # PATCH/PUT /chronicles/1.json
  def update
    respond_to do |format|
      if @chronicle.update(chronicle_params)
        format.html { redirect_to @chronicle, notice: 'Chronicle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @chronicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chronicles/1
  # DELETE /chronicles/1.json
  def destroy
    @chronicle.destroy
    respond_to do |format|
      format.html { redirect_to chronicles_url }
      format.json { head :no_content }
    end
  end

  private
    def fill_selects
      @moods = Chronicle::STATES_OF_MIND.map{|s| [t(s), s]}
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_chronicle
      @chronicle = Chronicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chronicle_params
      params.require(:chronicle).permit(:date, :summary, :mood)
    end
end
