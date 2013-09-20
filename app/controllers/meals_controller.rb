class MealsController < ApplicationController
  before_action :check_user_configuration
  before_action :set_meal, only: [:show, :edit, :update, :destroy]
  before_action :fill_selects, only: [:new, :create, :edit, :update]

  # GET /meals
  # GET /meals.json
  def index
    @meals = current_user.meals.ordered
  end

  # GET /meals/1
  # GET /meals/1.json
  def show
  end

  # GET /meals/new
  def new
    @meal = current_user.meals.new
  end

  # GET /meals/1/edit
  def edit
  end

  # POST /meals
  # POST /meals.json
  def create
    @meal = current_user.meals.new(meal_params)

    respond_to do |format|
      if @meal.save
        format.html { redirect_to root_path(date: I18n.l(@meal.date)), notice: t('flash_message.notice.successfully_created', model: Meal.model_name.human) }
        format.json { render action: 'show', status: :created, location: @meal }
      else
        format.html { render action: 'new' }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meals/1
  # PATCH/PUT /meals/1.json
  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to @meal, notice: t('flash_message.notice.successfully_updated', model: Meal.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to meals_url }
      format.json { head :no_content }
    end
  end

  private
    def check_user_configuration
      redirect_to edit_user_registration_path, alert: t('flash_message.error.configure_desired_options_to_use') unless current_user.use_meals?
    end

    def fill_selects
      @meal_kinds     = Meal::KINDS.map{|s| [t(s), s]}
      @meal_locations = Meal::LOCATIONS.map{|s| [t(s), s]}
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = current_user.meals.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_params
      params.require(:meal).permit(:datetime, :where, :kind, :description)
    end
end
