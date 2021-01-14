class PictureController < ApplicationController
  
  def index
    @pictures = Picture.where(:user_id => current_user.id)
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to @picture
    else
      render :new
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end 

  def update
    @picture = Picture.find(params[:id])

    if @picture.update(article_params)
      redirect_to @picture
    else
      render :edit
    end
  end

  private
    def picture_params
      params.require(:picture).permit(:title, :description, :image)
    end


end
