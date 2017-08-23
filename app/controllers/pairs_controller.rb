class PairsController < ApplicationController

  def new
    @pair = Pair.new
    @user = User.all
    @pair_collection = Pair.all
    @resume = Resume.all
  end

  def create
    @pair = Pair.new(pair_params)
    @pair.save
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

  def display_resume
    @show_resume = []
    for resume in @resume do
      for degree in has_degree do
        if resume.user_id == degree
          @show_resume.push(resume.user_id) #[0]

          if resume.high_school != nil && resume.high_school != "" #[1]
            @show_resume.push("Attend(ed) #{resume.high_school} Class of: #{resume.hs_class}")
          else
            @show_resume.push("")
          end

          if resume.first_sport != nil && resume.first_sport != "" #[2]
            @show_resume.push("Sports: #{resume.first_sport}")
          else
            @show_resume.push("")
          end

          if resume.second_sport != nil && resume.second_sport != "" #[3]
            @show_resume.push("#{resume.second_sport}")
          else
            @show_resume.push("")
          end

          if resume.third_sport != nil && resume.third_sport != "" #[4]
            @show_resume.push("#{resume.third_sport}")
          else
            @show_resume.push("")
          end

          if resume.first_hs_organization != nil && resume.first_hs_organization != "" #[5]
            @show_resume.push("Participated in: #{resume.first_hs_organization}")
          else
            @show_resume.push("")
          end

          if resume.second_hs_organization != nil && resume.second_hs_organization != "" #[6]
            @show_resume.push("#{resume.second_hs_organization}")
          else
            @show_resume.push("")
          end

          if resume.undergrad_uni != nil && resume.undergrad_uni != "" #[7]
            @show_resume.push("I attend(ed) #{resume.undergrad_uni} Class of: #{resume.undergrad_class}")
          else
            @show_resume.push("")
          end

          if resume.undergrad_degree_type != nil && resume.undergrad_degree_type != "" #[8]
            @show_resume.push("For a(n) #{resume.undergrad_degree_type} in #{resume.first_undergrad_major}")
          else
            @show_resume.push("")
          end

          if resume.second_undergrad_major != nil && resume.second_undergrad_major != "" #[9]
            @show_resume.push("and #{resume.second_undergrad_major}")
          else
            @show_resume.push("")
          end

          if resume.first_undergrad_minor != nil && resume.first_undergrad_minor != "" #[10]
            @show_resume.push("With a minor(s) in #{resume.first_undergrad_minor} #{resume.second_undergrad_minor} #{resume.third_undergrad_minor}")
          else
            @show_resume.push("")
          end

          if resume.second_undergrad_uni != nil && resume.second_undergrad_uni != "" #[11]
            @show_resume.push("Attend(ed) #{resume.second_undergrad_uni} Class of: #{resume.second_undergrad_class}")
          else
            @show_resume.push("")
          end

          if resume.second_undergrad_degree_type != nil && resume.second_undergrad_degree_type != "" #[12]
            @show_resume.push("For a(n) #{resume.second_undergrad_degree_type} in #{resume.second_undergrad_major}")
          else
            @show_resume.push("")
          end

          if resume.advanced_degree_uni != nil && resume.advanced_degree_uni != "" #[13]
            @show_resume.push("Attend(ed) #{resume.advanced_degree_uni} Class of: #{resume.advanced_degree_class}")
          else
            @show_resume.push("")
          end

          if resume.advanced_degree_major != nil && resume.advanced_degree_major != "" #[14]
            @show_resume.push("For a(n) #{resume.advanced_degree_type} in #{resume.advanced_degree_major}")
          else
            @show_resume.push("")
          end

          if resume.second_advanced_degree_type != nil && resume.second_advanced_degree_type != "" #[15]
            @show_resume.push("Attend(ed) #{resume.second_advanced_degree_uni} Class of: #{resume.second_advanced_degree_class}")
          else
            @show_resume.push("")
          end

          if resume.second_advanced_degree_major != nil && resume.second_advanced_degree_major != "" #[16]
            @show_resume.push("For a(n) #{resume.second_advanced_degree_type} in #{resume.second_advanced_degree_major}")
          else
            @show_resume.push("")
          end

          if resume.first_campus_organization != nil && resume.first_campus_organization != "" #[17]
            @show_resume.push("A member of: #{resume.first_campus_organization} #{resume.second_campus_organization}")
          else
            @show_resume.push("")
          end

          if resume.first_company_name != nil && resume.first_company_name != "" #[18]
            @show_resume.push("1) #{resume.first_job_title} for #{resume.first_company_name} from: #{resume.first_job_start_date} until: #{resume.first_job_end_date}")
          else
            @show_resume.push("")
          end

          if resume.second_company_name !=nil && resume.second_company_name != "" #[19]
            @show_resume.push("2) #{resume.second_job_title} for #{resume.second_company_name} from: #{resume.second_job_start_date} until: #{resume.second_job_end_date}")
          else
            @show_resume.push("")
          end

          if resume.third_company_name != nil && resume.third_company_name != "" #[20]
            @show_resume.push("3) #{resume.third_job_title} for #{resume.third_company_name} from: #{resume.third_job_start_date} until: #{resume.third_job_end_date}")
          else
            @show_resume.push("")
          end

          if resume.fourth_company_name != nil && resume.fourth_company_name != "" #[21]
            @show_resume.push("4) #{resume.fourth_job_title} for #{resume.fourth_company_name} from: #{resume.fourth_job_start_date} until: #{resume.fourth_job_end_date}")
          else
            @show_resume.push("")
          end

          if resume.first_volunteer_organization != nil && resume.first_volunteer_organization != "" #[22]
            @show_resume.push("Volunteer(ed) for: 1) #{resume.first_volunteer_organization}")
          else
            @show_resume.push("")
          end

          if resume.second_volunteer_organization != nil && resume.second_volunteer_organization != "" #[23]
            @show_resume.push("2) #{resume.second_volunteer_organization}")
          else
            @show_resume.push("")
          end

          if resume.third_volunteer_organization != nil && resume.third_volunteer_organization != "" #[24]
            @show_resume.push("3) #{resume.third_volunteer_organization}")
          else
            @show_resume.push("")
          end

          if resume.first_certification != nil && resume.first_certification != "" #[25]
            @show_resume.push("Certified in: 1) #{resume.first_certification}")
          else
            show_resume.push("")
          end

          if resume.second_certification != nil && resume.second_certification != "" #[26]
            @show_resume.push("2) #{resume.second_certification}")
          else
            @show_resume.push("")
          end

          if resume.third_certification != nil && resume.third_certification != "" #[27]
            @show_resume.push("3) #{resume.third_certification}")
          else
            @show_resume.push("")
          end

          if resume.first_hobby != nil && resume.first_hobby != "" #[28]
            @show_resume.push("I enjoy: 1) #{resume.first_hobby}")
          else
            @show_resume.push("")
          end

          if resume.second_hobby != nil && resume.second_hobby != "" #[29]
            @show_resume.push("2) #{resume.second_hobby}")
          else
            @show_resume.push("")
          end

          if resume.third_hobby != nil && resume.second_hobby != "" #[30]
            @show_resume.push("3) #{resume.third_hobby}")
          else
            @show_resume.push("")
          end
        end
      end
    end
    return @show_resume
  end

  helper_method :display_resume

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

#This method finds users who have agreed upon a mentor mentee relationship
  def agreed
    @choosen = []
    for pair in Pair.all
      if pair.user_id == current_user.id
        @choosen.push(pair.mentee_id)
      end
    end

    for picked in @choosen
      Pair.all.each do |p|
        if p.user_id == picked && p.mentee_id == current_user.id
          @pair.push(p.user_id)
        end
      end
    end
  end

helper_method :agreed

private
  def pair_params
    params.require(:pair).permit(:user_id, :mentee_id, :message)
  end

end
