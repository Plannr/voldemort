class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  def set_body_id(string)
    @body_id = string
  end

  def set_body_class(array)
    @body_class ||= []
    @body_class = @body_class + Array(array)
  end

end
