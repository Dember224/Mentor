class CreateResumes < ActiveRecord::Migration[5.1]
  def change
    create_table :resumes do |t|

      t.timestamps
      t.belongs_to :user
      t.string :high_school
      t.integer :hs_class
      t.string :first_sport
      t.string :second_sport
      t.string :third_sport
      t.string :first_hs_organization
      t.string :second_hs_organization
      t.string :undergrad_uni
      t.string :undergrad_degree_type
      t.integer :undergrad_class
      t.string :first_undergrad_major
      t.string :second_undergrad_major
      t.string :first_undergrad_minor
      t.string :second_undergrad_minor
      t.string :third_undergrad_minor
      t.string :second_undergrad_uni
      t.string :second_undergrad_degree_type
      t.integer :second_undergrad_class
      t.string :second_undergrad_major
      t.string :advanced_degree_type
      t.string :advanced_degree_major
      t.string :advanced_degree_uni
      t.integer :advanced_degree_class
      t.string :second_advanced_degree_type
      t.string :second_advanced_degree_uni
      t.string :second_advanced_degree_major
      t.integer :second_advanced_degree_class
      t.string :first_campus_organization
      t.string :second_campus_organization
      t.string :first_company_name
      t.string :first_job_title
      t.date :first_job_start_date
      t.date :first_job_end_date
      t.string :second_company_name
      t.string :second_job_title
      t.date :second_job_start_date
      t.date :second_job_end_date
      t.string :third_company_name
      t.string :third_job_title
      t.date :third_job_start_date
      t.date :third_job_end_date
      t.string :fourth_company_name
      t.string :fourth_job_title
      t.date :fourth_job_start_date
      t.date :fourth_job_end_date
      t.string :first_volunteer_organization
      t.string :second_volunteer_organization
      t.string :third_volunteer_organization
      t.string :first_certification
      t.string :second_certification
      t.string :third_certification
      t.string :first_hobby
      t.string :second_hobby
      t.string :third_hobby
    end
  end
end
