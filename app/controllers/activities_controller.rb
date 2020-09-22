class ActivitiesController < ApplicationController
  before_action :find_activity, only: [:show, :edit, :update]
  
  def index
    @activities = Activity.all
  end

  def show
  end

  def new
    @activity = Activity.new
    @activity.save
  end
  
  def create
    activity = Activity.create(activity_params)
    redirect_to activity_path(activity)
  end

  def edit
  end

  def update
    @activity.update
    redirect_to activity_path(@activity)
  end

  private

  def activity_params
    params.require(:activity).permit!
  end

  def find_activity
    @activity = Activity.find(params[:id])
  end
end
