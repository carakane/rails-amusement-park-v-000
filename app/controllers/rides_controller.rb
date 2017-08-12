class RidesController < ApplicationController

  def new
  end

  def create
    @ride = Ride.create(ride_params)
    @notice = @ride.take_ride
    @user = User.find(@ride.user_id)
    @attraction = Attraction.find(@ride.attraction_id)
    flash[:notice] = @notice
    redirect_to user_path(@user)
  end

  private

    def ride_params
      params.require(:ride).permit(:user_id, :attraction_id)
    end

end
