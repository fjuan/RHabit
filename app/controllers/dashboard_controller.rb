class DashboardController < ApplicationController
  before_action :set_date

  def index
    @payments   = current_user.payments.ordered.by_date(@date)
    @meals      = current_user.meals.ordered.by_date(@date)
    @workouts   = current_user.workouts.ordered.by_date(@date)
    @chronicle  = current_user.chronicles.find_by(date: @date.to_date)
    challenges = current_user.challenges.by_date(@date.to_date)
    @challenges_and_milestones = challenges.inject({}){ |r, c| r.merge c => c.milestones.find_by(date: @date) }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_date
      begin
        @date = params[:date] && Date.parse(params[:date])
      rescue ArgumentError
      end

      @date ||= Date.today
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dashboard_params
      params.permit(:date)
    end
end
