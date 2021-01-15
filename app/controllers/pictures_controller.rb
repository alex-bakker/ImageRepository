class PicturesController < ApplicationController
  
  def index

    title_search = params[:search]

    if(! title_search.nil? && !title_search.to_s.strip.empty?)
      @search = title_search
      @pictures = Picture.where(["user_id = ? AND title LIKE (?)", current_user.id, "%#{title_search}%"])
    else
      @pictures = Picture.where(:user_id => current_user.id)
      @search= nil
    end
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

    if @picture.update(picture_params)
      redirect_to @picture
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to root_path
  end

  private
    def picture_params
      params.require(:picture).permit(:title, :description, :image)
    end

end
