class ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :all_user_snippets_by_type, only: [:new, :index, :create, :update]

  def index
    @resumes = current_user.resumes
  end

  def show
    @resume = Resume.find(params[:id])
    @resume_snippets = ResumeSnippet.where(resume_id: @resume)
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(name: params[:name])
    @resume.user = current_user
    @resume.save
    params[:snippet].each do |key,value|
      @resume_snippet = ResumeSnippet.new(position: value[:position], snippet_id: value[:id])
      @resume_snippet.resume = @resume
      @resume_snippet.save
    end

    render :js => "window.location = '#{resume_path(@resume)}'"

  end

  def edit
  end

  def update
  end

  def destroy
  end

  def sort
    params[:order].each do |key,value|
      ResumeSnippet.find(value[:snippet_id]).update_attribute(:position,value[:position])
    end
    render :nothing => true
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
