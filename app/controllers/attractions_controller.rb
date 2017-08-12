class AttractionsController < ApplicationController

  def index
    @attraction = Attraction.new
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
    if @user.admin
      render '/attractions/admin'
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new
    @user = User.find(session[:user_id])
    if @user.admin
      @attractions = Attraction.all
      render '/attractions/admin'
    end
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
  end

  private

      def attraction_params
        params.require(:attraction).permit(:name, :tickets, :happiness_rating, :nausea_rating, :min_height)
      end
end
