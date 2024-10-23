class PhotosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :only_admin_can_manage_photos, only: [:new, :create, :edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
    @comment = Comment.new
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      redirect_to @photo, notice: "Foto subida exitosamente."
    else
      render :new
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to @photo, notice: "Foto actualizada exitosamente."
    else
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path, notice: "Foto eliminada exitosamente."
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end

  def only_admin_can_manage_photos
    redirect_to root_path, alert: "No tienes permiso para realizar esta acción." unless current_user.admin?
  end
end
