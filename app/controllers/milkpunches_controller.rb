class MilkpunchesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @new_punch = Milkpunch.new
    @left_punch = current_user.last_left
    @right_punch = current_user.last_right
    @bottle_punch = current_user.last_bottle
    @meds_punch = current_user.last_meds
  end

  def create
    current_user.milkpunches.create(milkpunch_params)
    redirect_to milkpunches_path
  end

  private

  def milkpunch_params
    params.require(:milkpunch).permit(:boob)
  end
end
