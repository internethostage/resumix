class SnippetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_snippet, only: [:show, :edit, :update, :destroy]
  before_action :all_user_snippets_by_type, only: [:index, :create, :update]
  before_action :set_type

  def index
  end

  def show
  end

  def new
    @snippet = type_class.new
  end

  def create
    user = current_user
    @snippet = type_class.new snippet_params
    @snippet.user = user
    respond_to do |format|
      if @snippet.save
        format.html { redirect_to @snippet, notice: "#{@snippet.type} was successfully created." }
        format.js { render :create_success }
      else
        format.html {render action: 'new' }
        format.js { render :create_failure }
      end
    end
  end

  def edit
  end

  def update
    if @snippet.update snippet_params
      respond_to do |format|
        format.html { redirect_to snippets_url, notice: "#{@snippet.type} was successfully updated." }
        format.js   { render }
      end
    else
      render action: 'edit'
    end
  end


  def destroy
    @snippet.destroy
    respond_to do |format|
      format.html { redirect_to snippets_url}
      format.js   { render }
    end
  end


  private

  def set_type
    @type = type
  end

  def type
    Snippet.types.include?(params[:type]) ? params[:type] : "Snippet"
  end

  def type_class
    type.constantize
  end

  def set_snippet
    @snippet = type_class.find(params[:id])
  end

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

  def snippet_params
    params.require(type.underscore.to_sym).permit(
                                                  :name,
                                                  :type,
                                                  {properties: [
                                                                :accomplishment,
                                                                :address,
                                                                :address2,
                                                                :company,
                                                                :custom,
                                                                :custom2,
                                                                :description,
                                                                :details,
                                                                :email,
                                                                :end_date,
                                                                :first_name,
                                                                :fullname,
                                                                :github,
                                                                :institution,
                                                                :interest,
                                                                :language,
                                                                :last_name,
                                                                :level,
                                                                :linkedin,
                                                                :location,
                                                                :organization,
                                                                :other,
                                                                :phone,
                                                                :position,
                                                                :skill,
                                                                :start_date,
                                                                :title,
                                                                :zipcode,
                                                                ]})
  end

end
