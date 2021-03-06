class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]

  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = Upload.all
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
  end

  # GET /uploads/new
  def new
    @upload = Upload.new
  end

  # GET /uploads/1/edit
  def edit
  end

  # POST /uploads
  # POST /uploads.json
  def create
    if(Restaurant.where(location: params[:upload][:location]).blank?)
      @restaurant = Restaurant.new(:restaurant_name => params[:restaurant_name],
                                   :location => params[:upload][:location],
                                   :geo_loaction => params[:upload][:geo_location],
                                   :rating_img => params[:rating_img],
                                   :yelp_url => params[:yelp_url])
      @restaurant.save
    end

    upload_params[:picture].original_filename =
      generate_filename(upload_params[:picture].original_filename)
    @upload = Upload.new(upload_params)
    @upload.rating = params[:rating]
    @upload.restaurant_id = Restaurant.where(restaurant_name: params[:restaurant_name]).first.id


    respond_to do |format|
      if @upload.save
        # format.html { redirect_to @upload, notice: 'Upload was successfully created.' }
        # format.json { render action: 'show', status: :created, location: @upload }
        format.html {redirect_to '/main' }
        format.json {head :no_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uploads/1
  # PATCH/PUT /uploads/1.json
  def update
    respond_to do |format|
      if @upload.update(upload_params)
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params.require(:upload).permit(:name, :description, :picture, :user_id, :location, :geo_location)

    end

    def name_exists?(file_name)
      !Upload.where(picture: file_name).empty?
    end

    def generate_filename(file_name)
      if(name_exists?(file_name))
        generate_filename(Digest::SHA1.hexdigest(Time.now.to_s) +
                          File.extname(file_name))
      else
        return file_name
      end
    end
end
