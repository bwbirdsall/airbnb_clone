class PropertiesController < ApplicationController

  def index
    @properties = Property.all

    if params[:property].present?
      if params[:property][:rental_type] != "All"
        @properties = @properties.where(rental_type: params[:property][:rental_type])
      end
      # this uses the location name not because it is location, but because there is no single field that holds a string for price.
      if params[:property][:location] == "Expensive"
        @properties = @properties.where("price_day >= 50")
      end
      if params[:property][:location] == "Reasonable"
        @properties = @properties.where("price_day < 50 AND price_day > 20")
      end
      if params[:property][:location] == "Cheap"
        @properties = @properties.where("price_day <= 50")
      end
    end
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new property_params
    if !params[:property][:image].nil?
      picture = @property.pictures.new(:user_id => params[:property][:user_id], :property_id => @property.id)
      picture.image = params[:property][:image]
      picture.save
    end
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
    authorize! :update, @property
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

  def destroy
    @property = Property.find(params[:id])
    authorize! :destroy, @property
    @property.destroy
    redirect_to root_url, notice: "Property Listing Removed."
  end

private


  def property_params
    params.require(:property).permit(:name, :location, :description, :user_id, :price_day, :price_week, :price_month, :rental_type)
  end
end
