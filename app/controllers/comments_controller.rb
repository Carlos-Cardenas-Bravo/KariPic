class CommentsController < ApplicationController
  before_action :set_photo
  before_action :set_comment, only: [:destroy]

  # POST /photos/:photo_id/comments
  def create
    @comment = @photo.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @photo, notice: "Comentario agregado exitosamente." }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { redirect_to @photo, alert: "No se pudo agregar el comentario." }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/:photo_id/comments/:id
  def destroy
    @comment.destroy!

    respond_to do |format|
      format.html { redirect_to @photo, status: :see_other, notice: "Comentario eliminado exitosamente." }
      format.json { head :no_content }
    end
  end

  private

  # Encuentra la foto asociada
  def set_photo
    @photo = Photo.find(params[:photo_id])
  end

  # Encuentra el comentario asociado
  def set_comment
    @comment = @photo.comments.find(params[:id])
  end

  # Solo permite los parámetros permitidos
  def comment_params
    params.require(:comment).permit(:content)
  end
end
