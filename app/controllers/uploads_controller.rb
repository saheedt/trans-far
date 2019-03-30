class UploadsController < ApplicationController
  before_action :set_resource, only: %i[show edit update destroy]
  def index
    @uploads = Upload.all
  end

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(permitted_params)

    respond_to do |format|
      if @upload.save
        format.html { redirect_to @upload, message: 'File upload successful' }
        format.json { render :show, status: :created, location: @upload }
      else
        format.html { render :new }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def update
    respond_to do |format|
      if @upload.update(permitted_params)
        format.html { redirect_to @upload, notice: 'Upload successfully updated.' }
        format.json { render :show, status: :ok, location: @upload }
      else
        format.html { render :edit }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url, notice: 'Upload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit; end

  private

  def set_resource
    @upload = Upload.find(params[:id])
  end

  def permitted_params
    params.require(:upload).permit(:title, :description, files: [])
  end
end
