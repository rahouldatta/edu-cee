class InstitutionController < ApplicationController
  before_filter :authenticate_institution!

  def show
    @institution = current_institution
    @teacher_enrolled = Teacher.where(:institution_id => current_institution.id)
    @students_enrolled = Student.where(:institution_id => current_institution.id)
    @examinations = @institution.examinations.order(:standard).group_by(&:standard)
  end

  def add_teacher_to_institute
    id = params[:teacher_name]
    unless id.nil?
      t = Teacher.find(id.split("(").last.chop)
      t.update_attributes(:institution_id => current_institution.id)
    end
    redirect_to :back
  end

  def remove_teacher_from_institution
    t = Teacher.find(params[:id])
    t.update_attributes(:institution_id => nil)
    redirect_to :back
  end

  def add_student_to_institute
    id = params[:student_name]
    unless id.nil?
      t = Student.find(id.split("(").last.chop)
      t.update_attributes(:institution_id => current_institution.id)
    end
    redirect_to :back
  end

  def remove_student_from_institution
    t = Student.find(params[:id])
    t.update_attributes(:institution_id => nil)
    redirect_to :back
  end

end
