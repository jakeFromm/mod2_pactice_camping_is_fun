class SignupsController < ApplicationController
    # before_action :find_signup, only: [:show, :edit, :update]
  

  def new
    @signup = Signup.new
  end
  
  def create
    signup = Signup.create(signup_params)
    if signup.valid?
        signup.save
        redirect_to camper_path(signup.camper)
    else
        flash[:messages] = signup.errors.full_messages
        render :new
    end
  end


  private

  def signup_params
    params.require(:signup).permit!
  end

  def find_signup
    @signup = Signup.find(params[:id])
  end
end
