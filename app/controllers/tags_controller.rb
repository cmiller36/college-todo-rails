class TagsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @tag = Tag.friendly.find(params[:id])
  end

end