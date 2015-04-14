class CommentController < ApplicationController
	
	def new
    	# @comment = Comment.new
    	redirect_to main_path
  	end
#more tests more more mroe
	def create

		upload = Upload.find(params[:upload_id])

		comment_params = Hash.new 
		comment_params[:upload_id] = params[:upload_id]
		comment_params[:description] = params[:description]
		comment_params[:user_id] = params[:user_id]		


		#comment params need to change to whatever we pass in the text box
		comment = upload.comments.create(comment_params)
		if comment.save
     	 redirect_to main_path
    	else
      	flash.now[:danger] = "error with comment save"
    	end
	end

	private 
	def comment_params
    	params.require(:comment).permit(:user_id, :upload_id, :description)
  	end
end