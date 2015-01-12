class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  responders :location, :flash
  respond_to :html
  protected

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
end
