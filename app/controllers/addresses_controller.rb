class AddressesController < ApplicationController

  def new
    @student = Student.find(params[:student_id])
    @address = Address.new
  end

  def create
    @student = Student.find(params[:student_id])
    @address = @student.addresses.new(address_params)
    if @address.save
      flash[:success] = "You created a new address for #{@student.name}"
      redirect_to student_path(@student)
    else
      flash[:success] = "Address did not save"
      redirect_to new_student_address_path(@student)
    end
  end

  private

  def address_params
    params.require(:address).permit(:description, :street, :city, :state, :zip_code)
  end
end
