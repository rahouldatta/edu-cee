class InstitutionController < ApplicationController
  before_filter :authenticate_institution!

  def show
    @institution = current_institution
    @teacher_enrolled = Teacher.where(:institution_id => current_institution.id)
  end

  def add_teacher_to_institute
    id = params[:teacher_name]
    t = Teacher.find(id.split(".").first)
    t.update_attributes(:institution_id => current_institution.id)
    redirect_to :back
  end
end
