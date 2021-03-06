class ChroniclesController < ApplicationController
  before_action :check_user_configuration
  before_action :set_chronicle, only: [:show, :edit, :update, :destroy]
  before_action :fill_selects, only: [:new, :create, :edit, :update]

  # GET /chronicles
  # GET /chronicles.json
  def index
    @chronicles = current_user.chronicles.ordered
  end

  # GET /chronicles/1
  # GET /chronicles/1.json
  def show
  end

  # GET /chronicles/new
  def new
    @chronicle = current_user.chronicles.new
  end

  # GET /chronicles/1/edit
  def edit
  end

  # POST /chronicles
  # POST /chronicles.json
  def create
    @chronicle = current_user.chronicles.new(chronicle_params)

    respond_to do |format|
      if @chronicle.save
        format.html { redirect_to root_path(date: I18n.l(@chronicle.date)), notice: t('flash_message.notice.successfully_created', model: Chronicle.model_name.human) }
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
        format.html { redirect_to @chronicle, notice: t('flash_message.notice.successfully_updated', model: Chronicle.model_name.human) }
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
    def check_user_configuration
      redirect_to edit_user_registration_path, alert: t('flash_message.error.configure_desired_options_to_use') unless current_user.use_chronicles?
    end

    def fill_selects
      @moods = Chronicle::STATES_OF_MIND.map{|s| [t(s), s]}
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_chronicle
      @chronicle = current_user.chronicles.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chronicle_params
      params.require(:chronicle).permit(:date, :summary, :mood)
    end
end
