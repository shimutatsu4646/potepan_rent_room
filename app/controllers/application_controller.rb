class ApplicationController < ActionController::Base
  include SessionsHelper
  include ApplicationHelper

  private

    def logged_in_user
      unless logged_in?
        redirect_to login_path
      end
    end
end
