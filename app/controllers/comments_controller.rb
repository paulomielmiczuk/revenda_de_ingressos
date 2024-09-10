class CommentsController < ApplicationController
  before_action :set_event
  before_action :set_post

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      render turbo_stream: turbo_stream.append("post_#{@post.id}_comments", partial: "events/comment", locals: { comment: @comment, post: @post }), notice: 'Comment created successfully.'
    else
      redirect_to @post.event, alert: 'Failed to create comment.'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
    respond_to do |format|
      format.html { redirect_to @post.event }
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@comment) }
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
