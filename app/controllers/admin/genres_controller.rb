# frozen_string_literal: true

class Admin::GenresController < ApplicationController
  before_action :current_admin

  def new
    @new_genre = Genre.new
  end

  def index
    @genres = Genre.all
  end

  def create
    @new_genre = Genre.new(genre_params)
    if @new_genre.save
      redirect_to admin_genres_path,
      notice: 'ジャンルを作成しました'
    else
      render 'index'
    end
  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to admin_genres_path,
    notice: 'ジャンルを削除しました'
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :icon_id)
  end
end
