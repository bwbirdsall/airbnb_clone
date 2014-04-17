class PropertiesController < ApplicationController

  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new property_params
    @property.pictures << Picture.create(property_params[:image])
    if @property.save
      flash[:notice] = "Your property was uploaded!  Please hold tight while we verify all the information! (Should take less than 36 months)"
      redirect_to property_path(@property)
    else
      render 'new'
    end
  end

  def show
    @property = Property.find(params[:id])
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    picture = @property.pictures.new(:user_id => params[:property][:user_id], :property_id => @property.id)
    picture.image = params[:property][:image]
    picture.save
    if @property.update(property_params)
      flash[:notice] = "Your property was updated! Thank you for keeping its information current!"
      redirect_to property_path(@property)
    else
      render 'edit'
    end
  end

private
  def property_params
    params.require(:property).permit(:name, :location, :description, :user_id, :price_day, :price_week, :price_month, :rental_type)
  end
end
