class CommentsController < ApplicationController
  before_action :require_login, except: [:new, :create, :show, :edit, :update, :delete]
  def create
  	event = Event.find(comment_params[:event])
  	user = current_user.id
  	event.comments.create(comment: comment_params[:comment], user: current_user)
  	redirect_to :back
  end

  def show
  end

  private
  def comment_params
  	params.require(:comments).permit(:id, :comment, :user, :event)
  end
end
