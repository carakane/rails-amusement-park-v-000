class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :attraction
  belongs_to :user

  def take_ride
    @attraction = self.attraction
    @user = self.user

    if @attraction.tickets > @user.tickets && @attraction.min_height > @user.height
      @notice = "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif @attraction.tickets > @user.tickets
      @notice = "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    elsif @attraction.min_height > @user.height
      @notice = "Sorry. You are not tall enough to ride the #{@attraction.name}."
    else
      @user.tickets -= @attraction.tickets
      @user.nausea += @attraction.nausea_rating
      @user.happiness += @attraction.happiness_rating
      @user.save
      @notice = "Thanks for riding the #{@attraction.name}!"
    end
  end
end
