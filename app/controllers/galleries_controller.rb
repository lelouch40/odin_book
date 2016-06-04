class GalleriesController < ApplicationController
  before_filter :authenticate_user!

  # GET /galleries
  # GET /galleries.json

  # GET /galleries/1
  # GET /galleries/1.json
      def show
    @gallery = Gallery.find(params[:id])
  end

  # GET /galleries/new
  def new
    @gallery = Gallery.new
  end

  # GET /galleries/1/edit
  def edit
  end

  # POST /galleries
  # POST /galleries.json
  def new
    @gallery=Gallery.new
  end
  def create
    @gallery=current_user.galleries.build(gallery_params)
    if @gallery.save
    redirect_to current_user
    flash[:sucess]="Created gallery"
  else
        render "new"
        flash[:error]= "Something went wrong"
    end
    end

  # PATCH/PUT /galleries/1
  # PATCH/PUT /galleries/1.json
  def update
    respond_to do |format|
      if @gallery.update(gallery_params)
        format.html { redirect_to @gallery, notice: 'Gallery was successfully updated.' }
        format.json { render :show, status: :ok, location: @gallery }
      else
        format.html { render :edit }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to galleries_url, notice: 'Gallery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_params
      params.require(:gallery).permit(:user_id, :photo_id)
    end
end
