class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]

  # GET /exercises
  # GET /exercises.json
  def index
    @exercises = Exercise.all
  end

  # GET /exercises/1
  # GET /exercises/1.json
  def show
    @courses = Course.all
    @exams = Exam.all
  end

  def update_exams
    course = Course.find(params[:course_id])
    @exams = course.exams.map{|e| [e.date, e.id]}.insert(0, 'Select an Exam ')
  end

  def add_to_exam
    exam = Exam.find(params[:exam_id])
    exercise = Exercise.find(params[:exercise_id])

    exams_exercises_entry = ExamsExercise.new exam_id:params[:exam_id], exercise_id:params[:exercise_id]

    if exams_exercises_entry.save
      redirect_to exercise_path(exercise), notice: 'Exercise was successfully added to the exam'
    else
      redirect_to exercise_path(exercise), notice: 'Unable to add the exercise to the exam, this is most likely because exercise is already part of the exam.'
    end
  end

  # GET /exercises/new
  def new
    @exercise = Exercise.new
  end

  # GET /exercises/1/edit
  def edit
  end

  # POST /exercises
  # POST /exercises.json
  def create
    @exercise = Exercise.new(exercise_params)

    respond_to do |format|
      if @exercise.save
        format.html { redirect_to @exercise, notice: 'Exercise was successfully created.' }
        format.json { render action: 'show', status: :created, location: @exercise }
      else
        format.html { render action: 'new' }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercises/1
  # PATCH/PUT /exercises/1.json
  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to @exercise, notice: 'Exercise was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @exercise.destroy
    respond_to do |format|
      format.html { redirect_to exercises_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exercise_params
      params.require(:exercise).permit(:points, :question, :answer, :criteria)
    end
end