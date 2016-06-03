class ResumesController < ApplicationController
  before_action :all_user_snippets_by_type, only: [:new, :index, :create, :update]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def all_user_snippets_by_type
    @accomplishments = current_user.accomplishments.order(name: :ASC)
    @details         = current_user.details.order(name: :ASC)
    @educations      = current_user.educations.order(name: :ASC)
    @endorsements    = current_user.endorsements.order(name: :ASC)
    @experiences     = current_user.experiences.order(name: :ASC)
    @interests       = current_user.interests.order(name: :ASC)
    @languages       = current_user.languages.order(name: :ASC)
    @others          = current_user.others.order(name: :ASC)
    @skills          = current_user.skills.order(name: :ASC)
    @summaries       = current_user.summaries.order(name: :ASC)
  end

end
