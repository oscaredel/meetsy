class CommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @contact = Contact.find(session[:uuid])
    @update = Update.new
    @response = Response.new
    @photo = Photo.new
    @photos = @event.photos.reverse.take(5)
    @comment = Comment.new(comment_params)

    commented_update = Update.find(params[:update_id])

    @comment.commentable = commented_update
    @comment.contact = @contact

    if @comment.save
      redirect_to event_path(@event)
    else
      render 'events/show'
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @update = Update.find(params[:update_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to event_path(@event)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

end
