require 'rails_helper'
RSpec.describe Genre, type: :model do
  context "データが正しく保存される" do
    before do
      @new_genre = Genre.new
      @new_genre.name = 'Hello WebCamp'
      @new_genre.icon_id = ''
      @new_genre.save
    end
    it '全て入力してあるので保存される' do
      expect(@new_genre).to be_valid
    end
  end
  context 'データが正しく保存されない' do
    before do
      @new_genre = Genre.new
      @new_genre.name = ''
      @new_genre.icon_id = ''
      @new_genre.save
    end
    it 'nameが入力されていないので保存されない' do
      expect(@new_genre).to be_invalid
      expect(@new_genre.errors[:name]).to include("can't be blank")
    end
  end
end
