class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:land, :translate]

  def land
  end

  def translate
    I18n.locale = params[:locale].to_sym
    redirect_to :back
  end
end
