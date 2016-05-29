class SnippetsController < ApplicationController
  before_action :set_snippet, only: [:show, :edit, :update, :destroy]
  before_action :set_type

  def index
    @snippets = type_class.all
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
    if @snippet.save
      redirect_to @snippet, notice: "#{@snippet.type} was successfully created."
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @snippet.update snippet_params
      redirect_to @snippet, notice: "#{@snippet.type} was successfully updated."
    else
      render action: 'edit'
    end
  end

  def destroy
    @snippet.destroy
    redirect_to snippets_url
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

  def snippet_params
    params.require(type.underscore.to_sym).permit(:name, :type, {properties: [:language, :level] })
  end



end
