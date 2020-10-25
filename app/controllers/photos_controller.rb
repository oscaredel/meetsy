class PhotosController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @photos = @event.photos.order("created_at").reverse
    @photo = Photo.new
  end

  def show
    @event = Event.find(params[:event_id])
    @photo = Photo.find(params[:id])
    # next photo is photo in @event.photos where photo.created_at is later than @photo.created_at

    @previous_photo = (Photo.order("created_at DESC").find_by "created_at < ?", @photo.created_at) || @event.photos.order("photos.created_at").last
    @next_photo = (Photo.find_by "created_at > ?", @photo.created_at) || @event.photos.order("photos.created_at").first

    @comment = Comment.new
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
