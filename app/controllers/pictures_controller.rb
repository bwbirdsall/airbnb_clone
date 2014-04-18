class PicturesController<ApplicationController
  def destroy
    @picture = Picture.find(params[:id])
    authorize! :destroy, @picture
    @picture.destroy
    redirect_to property_path(@picture.property), notice: "That photo will never again darken anyone's door."
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      @picture.property.thumbnail(@picture)
      @picture.update(:thumbnail => false)
      redirect_to picture_path(@picture), notice: "Thumbnail set!"
    end
  end


  private

  def picture_params
    params.require(:picture).permit(:thumbnail)
  end
end
