# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::Base
  include SessionsHelper

  def require_login
    redirect_to login_path unless logged_in?
  end
end
