class Question < ActiveRecord::Base
  attr_accessible :answer_tat, :correct_answer, :difficulty_level, :examination_id, :incorrect_answers, :question

  #============================== Serialized Columns ==============================
  serialize :question, Array
  serialize :incorrect_answers, Array

  #============================== Associations ==============================
  belongs_to :examination

end #class Question
