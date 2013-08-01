class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    if resource.class.to_s.eql? "Student"
      student_path(resource)
    elsif resource.class.to_s.eql? "Teacher"
      teacher_path(resource)
    elsif resource.class.to_s.eql? "Institution"
      institution_path(resource)
    else
      root_path
    end
  end

end
