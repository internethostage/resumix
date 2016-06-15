class ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :all_user_snippets_by_type, only: [:new, :index, :create, :update]
  before_action :find_resume, only: [:show, :destroy]

  def index
    @resumes = current_user.resumes
  end

  def show
    @resume_snippets = current_user.resumes.find(@resume.id).snippets.group_by(&:type)
    respond_to do |format|
      format.html do
        if params[:template] == "1"
          render layout: 'template1'
        elsif params[:template] == "2"
          render "show2", layout: 'template2'
        else
          render
        end
      end
      format.pdf do
        # use .pdf?template=2&debug=1 to view as html (for easier css styling)
        if params[:template] == "0"
          render pdf: "resume", layout: 'pdf.html.erb', :show_as_html => params[:debug].present?
        elsif params[:template] == "1"
          render pdf: "resume", layout: 'pdf1.html.erb', :show_as_html => params[:debug].present?
        elsif params[:template] == "2"
          render template: "resumes/show2", pdf: "resume", layout: 'pdf2.html.erb', :show_as_html => params[:debug].present?
        end
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
    @snippets = current_user.snippets.group_by(&:type)
  end

end
