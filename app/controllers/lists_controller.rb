class ListsController < ApplicationController
  def index
    @lists = List.includes([photo_attachment: :blob]).all
    @list = List.new # for rendering the add new list form
  end

  def show
    @list = List.includes(bookmarks: :movie).find(params[:id])
    @bookmark = Bookmark.new # for rendering the add new list form
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
