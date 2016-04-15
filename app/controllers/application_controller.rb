class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def get_environment
    unless ENV["VCAP_APPLICATION"].nil?
      @vcap_application = ENV["VCAP_APPLICATION"] unless JSON.parse(ENV["VCAP_APPLICATION"]).blank?
    end
    unless ENV["VCAP_SERVICES"].nil?
      @vcap_services = ENV["VCAP_SERVICES"] unless JSON.parse(ENV["VCAP_SERVICES"]).blank?
    end
    @app_instance_index = ENV["INSTANCE_INDEX"] unless ENV["INSTANCE_INDEX"].nil?
  end
end
