class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
  end

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "You created a new student named: #{@student.name}"
      redirect_to student_path(@student)
    else
      flash[:failure] = "You did not create a new student. Try again."
      redirect_to new_student_path
    end
  end

  private

  def student_params
    params.require(:student).permit(:name)
  end
end
