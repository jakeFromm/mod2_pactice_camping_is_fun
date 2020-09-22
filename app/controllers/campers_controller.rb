class CampersController < ApplicationController
  before_action :find_camper, only: [:show, :edit, :update]
  
  def index
    @campers = Camper.all
  end

  def show
  end

  def new
    @camper = Camper.new
    
  end
  
  def create
    camper = Camper.create(camper_params)
    if camper.valid?
      camper.save
      redirect_to camper_path(camper)
    else
      flash[:messages] = camper.errors.full_messages
      redirect_to new_camper_path(camper)
    end
    
  end

  def edit
  end

  def update
    @camper.update
    redirect_to camper_path(@camper)
  end

  private

  def camper_params
    params.require(:camper).permit!
  end

  def find_camper
    @camper = Camper.find(params[:id])
  end

end
