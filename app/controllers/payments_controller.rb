class PaymentsController < ApplicationController
  before_action :check_user_configuration
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_action :fill_selects, only: [:new, :create, :edit, :update]

  # GET /payments
  # GET /payments.json
  def index
    @payments = current_user.payments.ordered
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = current_user.payments.new
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = current_user.payments.new(payment_params)

    respond_to do |format|
      if @payment.save
        format.html { redirect_to root_path(date: I18n.l(@payment.date)), notice: t('flash_message.notice.successfully_created', model: Payment.model_name.human) }
        format.json { render action: 'show', status: :created, location: @payment }
      else
        format.html { render action: 'new' }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: t('flash_message.notice.successfully_updated', model: Payment.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url }
      format.json { head :no_content }
    end
  end

  private
    def check_user_configuration
      redirect_to edit_user_registration_path, alert: t('flash_message.error.configure_desired_options_to_use') unless current_user.use_payments?
    end

    def fill_selects
      @payment_categories = Payment::CATEGORIES.map{|s| [t(s), s]}
      @payment_methods    = Payment::METHODS.map{|s| [t(s), s]}
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = current_user.payments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:datetime, :category, :method, :shared, :description, :amount)
    end
end
