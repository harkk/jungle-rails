class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    @product = Product.find params[:product_id]
    @review = @product.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to product_path(@product_id)
    else
      render 'products/show'
    end
  end

  def destroy
    @product = Product.find params[:product_id]
    @review = Review.find params[:id]

    if @review.destroy
      redirect_to product_path(@product.id.reviews)
    else
      render 'products/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
  
end
