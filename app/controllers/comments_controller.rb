class CommentsController < ApplicationController
    def create
        @event = Event.find(params[:event_id])
        @comment = @event.comments.create(comment_params.merge({:commenter => current_user.name}))
        redirect_to event_path(@event)
    end
    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
end
