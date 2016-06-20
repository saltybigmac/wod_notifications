class PhoneNumbersController < ApplicationController
  def new
  end

  def create
    @phone_number = PhoneNumber.create(phone_params)
    if @phone_number.save
      flash[:notice] = "You will now start receiving WOD notifications daily at 6 am"
    else
      flash[:error] = "That phone number is already receiving texts"
    end
      redirect_to root_path
  end

  private

  def phone_params
    params.require(:phone_number).permit(:name, :number)
  end
end
