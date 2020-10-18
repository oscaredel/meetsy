class CommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @contact = Contact.find(session[:uuid])
    @update = Update.new
    @response = Response.new
    @photo = Photo.new
    @photos = @event.photos.reverse.take(5)
    @comment = Comment.new(comment_params)

    if params.include? :update_id
      commented_model = Update.find(params[:update_id])
    elsif params.include? :photo_id
      commented_model = Photo.find(params[:photo_id])
    end


    @comment.commentable = commented_model
    @comment.contact = @contact

    if @comment.save

      if params.include? :update_id
        redirect_to event_path(@event)
      elsif params.include? :photo_id
        redirect_to event_photo_path(@event, commented_model)
      end
    else
      render 'events/show'
    end
  end

  def destroy
    @event = Event.find(params[:event_id])

    if params.include? :update_id
      commented_model = Update.find(params[:update_id])
    elsif params.include? :photo_id
      commented_model = Photo.find(params[:photo_id])
    end

    @comment = Comment.find(params[:id])
    @comment.destroy

    if params.include? :update_id
      redirect_to event_path(@event)
    elsif params.include? :photo_id
      redirect_to event_photo_path(@event, commented_model)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

end
