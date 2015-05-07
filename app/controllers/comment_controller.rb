class CommentController < ApplicationController
	
	def new
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

		comment_params[:user_name] = User.find(params[:user_id]).email

		if comment.save
     	 # redirect_to main_path
		    respond_to do |format|
		        format.json { render json: comment_params}
		    end

    	end

	end

	private 
	def comment_params
    	params.require(:comment).permit(:user_id, :upload_id, :description)
  	end
end