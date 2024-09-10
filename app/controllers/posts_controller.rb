class PostsController < ApplicationController
  before_action :set_event

  def create
    @post = @event.posts.build(post_params)
    @post.user = current_user
    if @post.save
      render turbo_stream: turbo_stream.prepend(:posts, partial: "events/post", locals: { post: @post }), alert: 'Post created successfully.'
    else
      redirect_to @event, alert: 'Failed to create post.'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to @event
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
