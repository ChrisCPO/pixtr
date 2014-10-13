class GalleriesController < ApplicationController
  def index 
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
  end

  def create 
    gallery_params = params.require(:gallery).permit(:name, :description, :cover_image)
    @gallery = Gallery.create(gallery_params)

    if @gallery.save
      redirect_to gallery_path(@gallery)
    else
      render(:new)
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    gallery_params = params.require(:gallery).permit(:name, :description, :cover_image)
    @gallery.update(gallery_params)

    redirect_to gallery_path(@gallery)
  end

  def destroy
    gallery = Gallery.find(params[:id])
    gallery.destroy
    redirect_to "/galleries"
  end
end

