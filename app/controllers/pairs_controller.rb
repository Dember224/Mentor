class PairsController < ApplicationController

  def new
    @pair = Pair.new
    @user = User.all
    @pair_collection = Pair.all
  end

  def create
    @pair = Pair.new(pair_params)
    @pair.save
  end

#options method is intended to produce matches in the same profession but with the opposite expertise so experts and beginners are paired.
  def options
    @match = []
    for match in @user do
      if (current_user.career_id == match.career_id) && (current_user.expertise != match.expertise)
        @match.push(match.id)

      else
        puts "Sorry, we don't seem to have what you're looking for right now. Please try back later."

      end
    end
    return @match
  end

  helper_method :options

#The choosen method checks to see if anyone else has choosen you as a potential mentor/mentee
  def choosen
    @pair = []
    for pair in @pair_collection do
      if pair.mentee_id == current_user.id
        @pair.push(pair.user_id)
      end
    end
    return @pair
  end

  helper_method :choosen
#This method gives all potential mentees that the current user has choosen
  def users_choices
    @pair = []
    for pair in @pair_collection do
      if current_user.id == pair.user_id
        @pair.push(pair.mentee_id)
      end
    end
    return @pair
  end

helper_method :users_choices

#This method finds users who have agreed upon a mentor mentee relationship
  def agreed
    @pair = []
    users_choices.each do |picked|
      for pair in @pair_collection do
        if picked == pair.user_id && pair.mentee_id == current_user.id
          @pair.push(pair.mentee_id)
      end
    end
    return @pair
  end

helper_method :agreed

private
  def pair_params
    params.require(:pair).permit(:user_id, :mentee_id, :message)
  end

end
