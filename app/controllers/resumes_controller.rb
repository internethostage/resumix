class ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :all_user_snippets_by_type, only: [:new, :index, :create, :update]
  before_action :find_resume, only: [:show, :destroy]

  def index
    @resumes = current_user.resumes
  end

  def show
    @resume_snippets = ResumeSnippet.where(resume_id: @resume)
    respond_to do |format|
      format.html
      format.pdf do
        # use .pdf?debug=1 to view as html (for easier css styling)
        render pdf: "resume", layout: 'pdf.html.erb', :show_as_html => params[:debug].present?
      end
    end
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
    @resume.destroy
    redirect_to resumes_path, alert: "Resume deleted successfully"
  end


  private

  def find_resume
    @resume = Resume.find(params[:id])
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

end
