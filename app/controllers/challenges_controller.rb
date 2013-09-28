class ChallengesController < ApplicationController
  before_action :check_user_configuration
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]
  before_action :fill_selects, only: [:new, :create, :edit, :update]

  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = current_user.challenges
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
    date = [@challenge.end_date, Date.today].min
    params[:month] ||= date.month.to_s
    params[:year]  ||= date.year.to_s
  end

  # GET /challenges/new
  def new
    @challenge = current_user.challenges.new
  end

  # GET /challenges/1/edit
  def edit
  end

  # POST /challenges
  # POST /challenges.json
  def create
    @challenge = current_user.challenges.new(challenge_params)

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to root_path, notice: t('flash_message.notice.successfully_created', model: Challenge.model_name.human) }
        format.json { render action: 'show', status: :created, location: @challenge }
      else
        format.html { render action: 'new' }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenges/1
  # PATCH/PUT /challenges/1.json
  def update
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to @challenge, notice: t('flash_message.notice.successfully_updated', model: Challenge.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @challenge.destroy
    respond_to do |format|
      format.html { redirect_to challenges_url }
      format.json { head :no_content }
    end
  end

  private
    def check_user_configuration
      redirect_to edit_user_registration_path, alert: t('flash_message.error.configure_desired_options_to_use') unless current_user.use_challenges?
    end

    def fill_selects
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = current_user.challenges.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_params
      params.require(:challenge).permit(:name, :start_date, :end_date, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
    end
end
