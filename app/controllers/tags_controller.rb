class TagsController < ApplicationController
 
  def show
    @tag = Tag.friendly.find(params[:id])
  end

end