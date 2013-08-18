class DashboardController < ApplicationController
  def index
    @payments  = Payment.all
    @meals     = Meal.all
    @chronicle = Chronicle.last
  end
end
