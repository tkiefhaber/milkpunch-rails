class StatsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @punches_today_hash = current_user.punches_today_hash
    @punches_today = current_user.punches_today
  end
end
