class CommentsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show] 
    before_action only: [:destroy] do
        authorize_request(["admin"])
        end
  
    
    def create
        @publication = Publication.find(params[:comment][:publication_id])
        @comment = Comment.new(comment_params)
        @comment.user = current_user
        respond_to do |format|
            if @comment.save
            format.html { redirect_to publication_path(@publication.id), notice:
            'Comment was successfully created.' }
            else
            format.html { redirect_to publication_path(@publication.id), notice:
            'Comment was not created.' }
            end
        end
    end
        
    def destroy
        @publication = Publication.find(params[:id])
        @comment = @publication.comments.find(params[:id])
        @comment.destroy
        #redirect_to publication_path(@publication), status: :see_other
        respond_to do |format|
            format.html { redirect_to publications_url, notice: "Comment was successfully destroyed." }
            format.json { head :no_content }
          end
    end
        
    private
    
    def comment_params
        params.require(:comment).permit(:content, :publication_id)
    end
    
end
