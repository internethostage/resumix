class StaticPagesController < ApplicationController

  def index
    render layout: "welcomepage"
  end

end
