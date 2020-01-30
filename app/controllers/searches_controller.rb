class SearchesController < ApplicationController
  def index
    @items = Item.where('name LIKE ?', "%#{params[:search]}%")
  end
end
