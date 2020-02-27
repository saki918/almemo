class Admin::GenresController < ApplicationController
  def new
    @new_genre = Genre.new
  end

  def index
    @genres = Genre.all
  end

  def create
    @new_genre = Genre.new(genre_params)
    if @new_genre.save
      flash[:notice] = 'ジャンルを作成しました'
      redirect_to admin_genres_path
    else
      render :new
    end
  end
  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    flash[:notice] = 'ジャンルを削除しました'
    redirect_to admin_genres_path
  end
private
  def genre_params
    params.require(:genre).permit(:name, :icon_id)
  end
end
