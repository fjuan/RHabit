class DashboardController < ApplicationController
  before_filter :set_date

  def index
    @payments  = Payment.by_date(@date)
    @meals     = Meal.ordered.by_date(@date)
    @chronicle = Chronicle.ordered.find_by_date(@date.to_date)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_date
      begin
        @date = params[:date] && Time.parse(params[:date])
      rescue ArgumentError
      end

      @date ||= Time.now
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dashboard_params
      params.permit(:date)
    end
end
