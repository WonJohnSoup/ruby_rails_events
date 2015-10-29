class EventsController < ApplicationController
  def index
  	@events = Event.all
  	@check_user = current_user
  	@joins = Join.where(user: @check_user)
  end

  def edit
  end

  def show
  	@event = Event.find(params[:id])
    @users = User.all
    @joins = Join.where(event: @event, user: @users)
    @comments = Comment.where(event: @event)
  end

  def create
   	user = User.find(current_user.id)

  	event = user.events.new(event_params)
  	if (event_params[:timing]) < Date.today.to_s
  		flash[:errors] = ["Make sure date is not in the past and city is correct!"]
  		redirect_to :back
  	else
  		event.save
  		redirect_to :back
  	end
  end

  def destroy
  	event = Event.find(event_params[:id])
  	event.destroy
  	redirect_to :back
  end

  def join
  	event = Event.find(params[:id])
  	user = User.find(current_user)
  	event = user.events.new(event_params)
  	Join.create(user: user, event: event)
  	redirect_to "/events"
  end

  def unjoin
  	event = Event.find(params[:id])
  	user = User.find(current_user)
  	Join.find_by(user: user, event: event).destroy
  	redirect_to "/events"
  end

  private
  def event_params
  	params.require(:events).permit(:id, :name, :timing, :location, :state)
  end
end
