class HomeController < ApplicationController
  def land
  end

  def translate
    I18n.locale = params[:locale].to_sym
    redirect_to :back
  end
end
