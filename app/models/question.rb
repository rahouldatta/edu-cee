class Question < ActiveRecord::Base
  attr_accessible :answer_tat, :correct_answer, :difficulty_level, :examination_id, :incorrect_answers, :question, :marks

  #============================== Serialized Columns ==============================
  serialize :question, Array
  serialize :incorrect_answers, Array

  #============================== Associations ==============================
  belongs_to :examination

  def self.make_creation_hash(params)
    question,incorrect_answers = [],[]
    question << params[:question]
    question << params[:dw_1] unless params[:dw_1].blank?
    question << params[:dw_2] unless params[:dw_2].blank?
    incorrect_answers << params[:iq_1]
    incorrect_answers << params[:iq_2]
    incorrect_answers << params[:iq_3]
    {:correct_answer => params[:correct_answer], :difficulty_level => params[:difficulty_level], :marks => params[:marks],
    :question => question, :incorrect_answers => incorrect_answers}
  end


end #class Question
