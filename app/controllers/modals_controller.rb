class ModalsController < ApplicationController

  def show

    @modal = modal_params
    respond_to do |format|
      format.js
    end


  end

  private

  def modal_params
    params.require(:modal).permit( :href, :partial )
  end


end
