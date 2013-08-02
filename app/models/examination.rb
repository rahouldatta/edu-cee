class Examination < ActiveRecord::Base
  attr_accessible :chapter, :institution_id, :subject, :total_marks, :total_time, :teacher_id, :standard, :difficulty_level

  #============================== Associations ==============================
  has_many :questions
  belongs_to :institution
  belongs_to :teacher

end #class Examination
