class PhotosController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @photos = @event.photos.reverse
    @photo = Photo.new
  end

  def show
    @event = Event.find(params[:event_id])
    @photo = Photo.find(params[:id])
  end

  def create
    @event = Event.find(params[:event_id])
    @contact = Contact.find(session[:uuid])

    photo_params[:images].each do |image|
      Photo.create(image: image, event: @event, contact: @contact)
    end

    redirect_to event_photos_path(@event)
  end

  def destroy
    @event = Event.find(params[:event_id])
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to event_photos_path(@event)
  end

  private

  def photo_params
    params.require(:photo).permit(images: [])
  end
end
