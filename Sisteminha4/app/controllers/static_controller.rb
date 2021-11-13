class StaticController < ApplicationController
  def static
    if params[:id] && template_exists?(params[:id], ["static"])
      render params[:id]
    else
      redirect_to '/404.html', :status => 404
    end
  end  
  
end
