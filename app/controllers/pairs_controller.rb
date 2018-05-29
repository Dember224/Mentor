class PairsController < ApplicationController

  def new
    @pair = Pair.new
    @user = User.all
    @pair_collection = Pair.all
    @resume = Resume.all
    @my_pairs = Pair.find_by_user_id(current_user.id)
    @my_resume = Resume.find_by_user_id(current_user.id)
    @matched_users = User.where(:id => options)
    @matched_resumes = Resume.where(:user_id => options)
    @resume_items = ["high_school", "hs_class", "first_sport", "second_sport", "third_sport", "first_hs_organization", "second_hs_organization", "undergrad_uni", "undergrad_degree_type", "undergrad_class", "first_undergrad_major", "second_undergrad_major", "first_undergrad_minor", "second_undergrad_minor", "third_undergrad_minor", "second_undergrad_uni", "second_undergrad_degree_type", "second_undergrad_class", "second_undergrad_major", "advanced_degree_type", "advanced_degree_uni", "advanced_degree_class", "second_advanced_degree_type", "second_advanced_degree_uni", "second_advanced_degree_major", "second_advanced_degree_class", "first_campus_organization", "second_campus_organization", "first_company_name", "first_job_title", "first_job_start_date", "first_job_end_date", "second_company_name", "second_job_title", "second_job_start_date", "second_job_end_date", "third_company_name", "third_job_title", "third_job_start_date", "third_job_end_date", "fourth_company_name", "fourth_job_title", "fourth_job_start_date", "fourth_job_end_date", "first_volunteer_organization", "second_volunteer_organization", "third_volunteer_organization", "first_certification", "second_certification", "third_certification", "first_hobby", "second_hobby", "third_hobby"]
#I made the resume table's columns an easily accessible variable.So I can loop through this variable when I want to call a resume.
  end

  def create
    @pair = Pair.new(pair_params)

    if @pair.save
      if agreed.is_a?(Integer)
        PairsMailer.match_email(User.find_by_id(current_user.id).email).deliver_now
        PairsMailer.match_email(User.find_by_id(agreed).email).deliver_now
      end
    end
  end

  def has_degree
    @has_resume = []
    for resume in @resume do
      for optional in options do
        if resume.user_id == optional
          @has_resume.push(resume.user_id)
        end
      end
    end

  return  @has_resume
  end

  helper_method :has_degree

  #I needed a way to pass resume items to the view
  #if and only if that resume item applied to that
  #particular user. So only show advanced_degree_uni
  #for users w/ advanced degrees.
  #I got impatient and wrote code that repeated a lot :(
  #Just wanted to hurry and get it done.


#options method is intended to produce matches in the same profession but with the opposite expertise so experts and beginners are paired.
  def options
    @my_career_id = current_user.career_id
    @match = []
    @peers = []
    @same_career = User.where(:career_id => @my_career_id)
    @same_career.each do |match| #This can be written with match.expertise != current_user.expertise but I'm anticipating adding more expertise options so I wrote it in a way where I can easily encorporate those later.
      if current_user.expertise == "Beginner"
        if match.expertise == "Expert" # NOTICE!!! Written this way in anticipation of adding more expertise options (Proficient, Masterful, Mid-level etc.)
          @match.push(match.id)
        elsif match.expertise =="Beginner"
          @peers.push(match.id)
        end
      elsif current_user.expertise == "Expert"
        if match.expertise == "Expert"
          @peers.push(match.id)
        elsif match.expertise == "Beginner"
          @match.push(match.id)
        end
      end
    end
    return @match[0..10] #first 11 matches User id's returned by this method
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

#This method finds users who have agreed upon a mentor mentee relationship
  def agreed
    @choosen = []
    @my_mentees = Pair.find_by_user_id(current_user.id).mentee_id
    if @my_mentees.is_a?(Integer)
      if Pair.find_by_user_id(@my_mentees) != nil
        @my_mentees_choice = Pair.find_by_user_id(@my_mentees).mentee_id
        if @my_mentees_choice == current_user.id
          @choosen.push(@my_mentees)
        end
      end
    else
      @my_mentees.each do |mentee|
        @mentees_matches = Pair.find_by_user_id(mentee).mentee_id
        if @mentees_matches.is_a?(Integer)
          if @mentees_matches == current_user.id
            @choosen.push(@mentees_matches)
          end
        elsif @mentees_matches != nil
        @mentees_matches.each do |me|
          if me == current_user.id
            @choosen.push(me)
          end
        end
        end
      end
    end
    return @choosen.last
  end

helper_method :agreed

def show
  @my_pairs = Pair.find_by_user_id(current_user.id)
end

def destroy
  @my_pairs = Pair.find(params[:id])
  @my_pairs.delete
  redirect_to '/hub/:id' and return
end

def update
  @my_pairs = Pair.find_by_user_id(:user_id)
end

private
  def pair_params
    params.require(:pair).permit(:user_id, :mentee_id, :message)
  end

end
