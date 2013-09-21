class MilestonesController < ApplicationController
  before_action :check_user_configuration
  before_action :set_challenge, only: [:complete]
  before_action :set_milestone, only: [:complete]

  def complete
    @milestone.mark_completed
    redirect_to root_path(date: I18n.l(@milestone.date)), notice: t('flash_message.notice.successfully_updated', model: Milestone.model_name.human)
  end

  private
    def check_user_configuration
      redirect_to edit_user_registration_path, alert: t('flash_message.error.configure_desired_options_to_use') unless current_user.use_challenges?
    end

    def set_challenge
      @challenge = current_user.challenges.find(params[:challenge_id])
    end

    def set_milestone
      @milestone = @challenge.milestones.find(params[:id])
    end
end