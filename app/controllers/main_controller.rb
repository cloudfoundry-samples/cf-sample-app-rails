class MainController < ApplicationController

  before_action :get_environment, only: [:index]
  before_action :get_app_name, only: [:index]
  before_action :get_app_uris, only: [:index]
  before_action :get_app_space, only: [:index]

  def index
    unless @vcap_application.blank?
      @application_mem_limits = JSON.parse( @vcap_application)["limits"]["mem"] unless @vcap_application.nil?
      @application_disk_limits = JSON.parse( @vcap_application)["limits"]["disk"] unless ENV["VCAP_APPLICATION"].empty?
    end
    unless @vcap_services.blank?
      @service_label = JSON.parse( @vcap_services).first[1][0]["label"] unless ENV["VCAP_SERVICES"].empty?
      @service_name = JSON.parse( @vcap_services).first[1][0]["name"] unless ENV["VCAP_SERVICES"].empty?
      @service_plan = ENV["VCAP_SERVICES"].empty? ? nil : JSON.parse( @vcap_services).first[1][0]["plan"]
    end
  end

  def get_app_name
    unless @vcap_application.blank?
      @application_name = JSON.parse( @vcap_application)["application_name"] unless @vcap_application.nil?
    end
  end

  def get_app_uris
    unless @vcap_application.blank?
      @application_uris = JSON.parse( @vcap_application)["uris"].join(', ') unless @vcap_application.nil?
    end
  end

  def get_app_space
    unless @vcap_application.blank?
      @app_space_name = JSON.parse( @vcap_application)["space_name"] unless @vcap_application.nil?
    end
  end

end
