class ResumesController < ApplicationController

  def new
    @resume = Resume.new
    @my_resume = Resume.find_by_user_id(current_user.id)
    if @my_resume != nil
      redirect_to '/pairs' and return
    end
  end


  def create
    @resume = Resume.new(resume_params)
    @resume.save
  end

  def update
  end

  private

  def resume_params
    params.require(:resume).permit(:user_id, :high_school, :hs_class, :first_sport, :second_sport, :third_sport, :first_hs_organization, :second_hs_organization, :undergrad_uni, :undergrad_degree_type, :undergrad_class, :first_undergrad_major, :second_undergrad_major, :first_undergrad_minor, :second_undergrad_minor, :third_undergrad_minor, :second_undergrad_uni, :second_undergrad_degree_type, :second_undergrad_class, :second_undergrad_major, :advanced_degree_type, :advanced_degree_uni, :advanced_degree_class, :second_advanced_degree_type, :second_advanced_degree_uni, :second_advanced_degree_major, :second_advanced_degree_class, :first_campus_organization, :second_campus_organization, :first_company_name, :first_job_title, :first_job_start_date, :first_job_end_date, :second_company_name, :second_job_title, :second_job_start_date, :second_job_end_date, :third_company_name, :third_job_title, :third_job_start_date, :third_job_end_date, :fourth_company_name, :fourth_job_title, :fourth_job_start_date, :fourth_job_end_date, :first_volunteer_organization, :second_volunteer_organization, :third_volunteer_organization, :first_certification, :second_certification, :third_certification, :first_hobby, :second_hobby, :third_hobby)
  end
end
