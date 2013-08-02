class ExaminationsController < ApplicationController
  before_filter :authenticate_member!

  def index
    @examinations = Examination.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @examinations }
    end
  end

  # GET /examinations/1
  # GET /examinations/1.json
  def show
    @examination = Examination.find(params[:id])
    @questions = @examination.questions
    @total_marks = 0
    @questions.each {|q| @total_marks +=q.marks}

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @examination }
    end
  end

  # GET /examinations/new
  # GET /examinations/new.json
  def new
    @examination = Examination.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @examination }
    end
  end

  # GET /examinations/1/edit
  def edit
    @examination = Examination.find(params[:id])
  end

  # POST /examinations
  # POST /examinations.json
  def create
    @examination = Examination.new(params[:examination])
    @examination.institution_id = current_member.institution_id
    @examination.teacher_id = current_member.id

    respond_to do |format|
      if @examination.save
        format.html { redirect_to @examination, notice: 'Examination was successfully created.' }
        format.json { render json: @examination, status: :created, location: @examination }
      else
        format.html { render action: "new" }
        format.json { render json: @examination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /examinations/1
  # PUT /examinations/1.json
  def update
    @examination = Examination.find(params[:id])

    respond_to do |format|
      if @examination.update_attributes(params[:examination])
        format.html { redirect_to @examination, notice: 'Examination was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @examination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /examinations/1
  # DELETE /examinations/1.json
  def destroy
    @examination = Examination.find(params[:id])
    @examination.destroy

    respond_to do |format|
      format.html { redirect_to examinations_url }
      format.json { head :no_content }
    end
  end

  def question_details
    @question = Question.find(params[:id])
    @examination = @question.examination
  end

  def add_question_to_examination
    exam = Examination.find(params[:examination_id])
    exam.questions.create(Question.make_creation_hash(params))
    redirect_to :back
  end

  def delete_question
    q = Question.find(params[:id])
    q.destroy
    redirect_to :back
  end

  def publish_examination
    e = Examination.find(params[:id])
    e.update_attributes(:allow_test => true)
    redirect_to :back
  end

  def halt_examination
    e = Examination.find(params[:id])
    e.update_attributes(:allow_test => false)
    redirect_to :back
  end

end
