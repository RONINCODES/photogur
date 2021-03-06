class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
    @month_old_pictures = Picture.created_before(1.month.ago)
    @year_old_pictures = Picture.pictures_created_in_year(1.year.ago.year)
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)

    # @picture.title = params[:picture][:title]
    # @picture.artist = params[:picture][:artist]
    # @picture.url = params[:picture][:url]



    if @picture.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      # otherwise render new.html.erb
      render :new
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    # @picture.title = params[:picture][:title]
    # @picture.artist = params[:picture][:artist]
    # @picture.url = params[:picture][:url]

    if @picture.update(picture_params)
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures"
  end

  def picture_params
    params.require(:picture).permit(:title, :artist, :url)
  end

end
