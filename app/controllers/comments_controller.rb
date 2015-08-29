class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  before_action :authenticate_user!
 
  # POST /comments
  # POST /comments.json

  def new 
    @comment =  current_user.comments.build(article_id: params[:article_id],parent: params[:parent])
  end
    
  def create
    @comment = current_user.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    msg =''
    if @comment.replies.count == 0
      @comment.destroy 
      msg = 'Comment was successfully destroyed.'
    else
      msg = "Comment can't be delete ."
    end  
    respond_to do |format|
      format.html { redirect_to comments_url, notice: msg }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :user_id, :article_id, :parent)
    end
end
