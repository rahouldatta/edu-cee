class StudentController < ApplicationController
  before_filter :authenticate_member!

  def show
    @student = current_member
    @available_exams = @student.institution.examinations.where(:standard => @student.qualifications.to_i, :allow_test => true) rescue ""
  end

end
