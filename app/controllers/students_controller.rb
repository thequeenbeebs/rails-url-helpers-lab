class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def edit
    @student = Student.find(params[:id])
    if @student.active == false
      @student.update(active: true)
    else
      @student.update(active: false)
    end
    redirect_to student_path(@student)
  end

  def show
    if @student.active == false
      @activity = "This student is currently inactive."
    else
      @activity = "This student is currently active."
    end
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end