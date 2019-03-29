class UploadsController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
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

  def show
  end

  def update
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private
  def set_resource
    @upload = Upload.find(params[:id])
  end
  def permitted_params
    params.require(:upload).permit(:title, :description, files: [])
  end
end
