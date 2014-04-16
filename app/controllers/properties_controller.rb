class PropertiesController < ApplicationController

  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new property_params
    if @property.save
      flash[:notice] = "Your property was uploaded!  Please hold tight while we verify all the information! (SHould take less than 36 months)"
      redirect_to property_path(@property)
    else
      render 'new'
    end
  end

  def show
    @property = Property.find(params[:id])
  end


private
  def property_params
    params.require(:property).permit(:name, :location, :description, :user_id, :price_day, :price_week, :price_month, :rental_type)
  end
end
