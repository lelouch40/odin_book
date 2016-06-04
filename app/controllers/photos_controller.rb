class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo=Photo.find(params[:id])
  end

  # GET /photos/new

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
    def new
    @gallery = Gallery.find(params[:gallery_id])
      @photo=@gallery.photos.build
 end
  def create
    @gallery = Gallery.find(params[:gallery_id])
      @photo=@gallery.photos.build(photo_params)
  @photo.user_id = current_user.id
  if @photo.save
    redirect_to @gallery
  else
    render("new")
    flash.now[:danger] = "error"
  end
 end
  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
          end
          redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:gallery_id, :photo, :user_id)
    end
end
