class Admin::GenresController < ApplicationController
  before_action :current_admin
  def new
    @new_genre = Genre.new
  end

  def index
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end
  def create
    @new_genre = Genre.new(genre_params)
    if @new_genre.save
      flash[:notice] = 'ジャンルを作成しました'
      redirect_to admin_genres_path
    else
      render 'index'
    end
  end
  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = 'ジャンルの編集に成功しました'
      redirect_to admin_genres_path
    else
      render 'edit'
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
