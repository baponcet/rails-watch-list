class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)

    redirect_to list_path(@list)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(list_id: params[:id])
    @movies = @bookmarks.map { |bookmark| bookmark.movie_id }
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to lists_path, status: :see_other
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
