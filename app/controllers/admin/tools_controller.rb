class Admin::ToolsController < ApplicationController

  def index
    name = "" if params[:name]
    @tools = Tool.where("name LIKE ?", "%#{name}%")
    render json: @tools
  end


  

end
