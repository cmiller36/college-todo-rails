class StoriesController < ApplicationController

  before_action :authenticate_user!  
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_action :owned_story, only: [:edit, :update, :destroy]
  

 
  def index
    @stories = Story.order(created_at: :desc).page(params[:page])
    @tags = Tag.all
    respond_to do |format|
        format.html { render :index }
        format.json { render json: @stories }
    end
  end


  def show
   @tags = @story.tags
    @comment = Comment.new
    @comments = @story.comments.order('created_at')
  end


  def new
    if !current_user
      redirect_to new_user_session_path, notice: "You must be logged in to create a story"
    else current_user.username == params[:user_id]
      @story = Story.new
      @story.tags.build
      @story.tags.build
      @story.tags.build
    end
  end

 
  def edit
  end


  def create
    @story = Story.new(story_params)
    @story.user = current_user

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:title, :content, :user_id, :tag_ids => [], :tags_attributes => [:name])
    end

    def owned_story  
      unless current_user == @story.user
      flash[:notice] = "That story doesn't belong to you!"
      redirect_to stories_path
    end
  end
end
