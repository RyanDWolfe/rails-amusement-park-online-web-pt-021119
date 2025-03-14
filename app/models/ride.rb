class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
      if user.tickets >= attraction.tickets && user.height >= attraction.min_height
        @user = User.find(user_id)
        @user.tickets -= attraction.tickets
        @user.nausea += attraction.nausea_rating
        @user.happiness += attraction.happiness_rating
        @user.save
        "Thanks for riding the #{self.attraction.name}!"
      elsif user.height >= attraction.min_height && user.tickets < attraction.tickets
        return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
      elsif user.height <= attraction.min_height && user.tickets >= attraction.tickets
        return "Sorry. You are not tall enough to ride the #{attraction.name}."
      else
        return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
      end
    end
end
