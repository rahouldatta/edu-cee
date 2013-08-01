class TeacherController < ApplicationController
  before_filter :authenticate_member!

  def show
    @teacher = current_member
  end

end
