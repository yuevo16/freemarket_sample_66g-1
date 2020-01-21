class PostController < ApplicationController
  def index
    @items = Item.all
    @images = Image.all 
  end

  


end
