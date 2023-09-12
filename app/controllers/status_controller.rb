class StatusController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :show_maintenance_page
  skip_after_action :save_current_store
end
