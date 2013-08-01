class Institution < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :institution_name, :institution_address, :institute_contact_details, :institution_board, :institute_description

  #============================== Associations ==============================
  has_many :teachers
  has_many :students
  has_many :examinations


  def self.get_available_teachers_info
    teachers = Teacher.where(:institution_id => nil)
    names = []
    teachers.each do |t|
      names << "#{t.first_name} #{t.last_name} (#{t.id})"
    end
    names
  end

  def self.get_available_student_info
    students = Student.where(:institution_id => nil)
    names = []
    students.each do |t|
      names << "#{t.first_name} #{t.last_name} (#{t.id})"
    end
    names
  end

end #class Institution
