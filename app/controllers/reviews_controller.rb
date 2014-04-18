class ReviewsController<ApplicationController
  def create
    @review = Review.new review_params
    if @review.save
      redirect_to property_path(@review.property)
    else
      render 'property#show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize! :destroy, @review
    @review.destroy
    redirect_to property_path(@review.property), notice: "That nasty review has been obliterated, thank goodness."
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :property_id, :header, :body)
  end
end
