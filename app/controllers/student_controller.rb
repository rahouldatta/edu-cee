class StudentController < ApplicationController
  before_filter :authenticate_member!

  def show
    @student = current_member
  end
end
