class Teacher < Member

  #============================== Associations ==============================
  belongs_to :institution
  has_many :examinations

end #class Teacher