class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # added here so that all controllers inherit (Rails automatically includes in SessionsController)
  include SessionsHelper
end
