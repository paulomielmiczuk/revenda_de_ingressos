class PostsController < ApplicationController
  before_action :set_event
  before_action :authenticate_user!

  def create
    @post = @event.posts.build(post_params)
    @post.user = current_user
    if @post.save
      # Turbo::StreamsChannel.broadcast_prepend_to(
      #   "event_#{@event.id}",
      #   target: 'posts',
      #   partial: "events/post",
      #   locals: { post: @post }
      # )
      render turbo_stream: turbo_stream.prepend(:posts, partial: "events/post", locals: { post: @post })
    else
      redirect_to @event, alert: 'Failed to create post.'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    # Turbo::StreamsChannel.broadcast_remove_to(
    #   "event_#{@event.id}",
    #   target: "post_#{@post.id}"
    # )
    respond_to do |format|
      format.html { redirect_to @event }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@post) }
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
