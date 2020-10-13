class PhotosController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @photos = @event.photos
    @photo = Photo.new
  end

  def show
    @event = Event.find(params[:event_id])
    @photo = Photo.find(params[:id])
  end

  def create
    @event = Event.find(params[:event_id])
    @contact = Contact.find(session[:uuid])

    @photo = Photo.new(photo_params)
    @photo.event = @event
    @photo.contact = @contact

    if @photo.save
      redirect_to event_photos_path(@event)
    else
      render 'new'
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to event_photos_path(@event)
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end
end
