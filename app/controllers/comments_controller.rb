class CommentsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @comments = @user.comments
    elsif params[:cast_id]
      @cast = Cast.find(params[:cast_id])
      @comments = @cast.comments
    else
      @comments = Comment.all
    end
    respond_to do |format|
      format.json do
        render :json => @comments.to_json(:include => { :user => { only: [:name,:id,:avatar] } })
      end
    end
  end

  def new
    @comment = Comment.new
  end

  def create
    @cast = Cast.find(params[:cast_id])
    @comment = Comment.new(params.permit(:content, :user_id, :cast_id))
    @comment.cast = @cast
    @comment.user = current_user
    if @comment.save
      redirect_to user_path(current_user)
    else
      flash.alert = "Your comment could not be published. Please correct the errors below."
      render "posts/show"
    end
  end

  def destroy
  end
end
