class PairsController < ApplicationController

  def new
    @pair = Pair.new
    @user = User.all
  end

  def create
    @pair = Pair.new(pair_params)
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

  def pair_params
    params.require(:pair).permit(:user_id, :mentee, :message)
  end

end
