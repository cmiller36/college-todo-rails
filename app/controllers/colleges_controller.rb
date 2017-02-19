class CollegesController < ApplicationController
  before_action :set_college, only: [:show, :edit, :update, :destroy]
  before_action :owned_college, only: [:edit, :update, :destroy]

  def index
    @colleges = current_user.colleges
  end

  def show
    
  end

  def new
    if !current_user
      redirect_to new_user_session_path, notice: "You must be logged in to create a story"
    else current_user.username == params[:user_id]
      @college = College.new
    end
  end

  def create
    @college = College.new(college_params)
     @college.user = current_user

     respond_to do |format|
      if @college.save
        format.html { redirect_to @college, notice: 'Your college was successfully created.' }
        format.json { render :show, status: :created, location: @college }
      else
        format.html { render :new }
        format.json { render json: @college.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @college.update(college_params)
        format.html { redirect_to @college, notice: 'Your college was successfully updated.' }
        format.json { render :show, status: :ok, location: @college }
      else
        format.html { render :edit }
        format.json { render json: @college.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @college.destroy
    respond_to do |format|
      format.html { redirect_to colleges_url, notice: 'Your college was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_college
      @college = College.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def college_params
      params.require(:college).permit(:user_id, :name, :submit_application, :pay_app_fee, :request_transcripts,
        :pay_transcript_fee, :request_scores, :pay_score_request_fee, :request_rec_letters, :college_visit)
    end

    def owned_college  
      unless current_user == @college.user
      flash[:notice] = "That college doesn't belong to you!"
      redirect_to colleges_path
      end
    end
end
