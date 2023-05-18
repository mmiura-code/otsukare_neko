class DiariesController < ApplicationController
  before_action :set_diary, only: %i[ show edit update destroy ]

  # GET /diaries or /diaries.json
  def index
    #@diaries = Diary.all.includes(:user).order(created_at: :desc)
    #@diaries = Diary.all.includes(:user).order(created_at: :desc)
    
    @diaries = Diary.where(user_id: current_user.id).order("created_at DESC")
    
  end

  # GET /diaries/1 or /diaries/1.json
  def show
    @diary = Diary.find(params[:id])

  end

  # GET /diaries/new
  def new
    @diary = Diary.new
  end

  # GET /diaries/1/edit
  def edit
    @diary = Diary.find(params[:id])
  end

  # POST /diaries or /diaries.json
  def create
    @diary = current_user.diaries.build(diary_params)
    
    if @diary.save
      byebug
      redirect_to diaries_path, success: t('defaults.message.created')
    else
      flash.now['danger'] = t('defaults.message.not_created')
      render :new
    end
  end

  # PATCH/PUT /diaries/1 or /diaries/1.json
  def update
    respond_to do |format|
      if @diary.update(diary_params)
        format.html { redirect_to diary_url(@diary), notice: "Diary was successfully updated." }
        format.json { render :show, status: :ok, location: @diary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diaries/1 or /diaries/1.json
  def destroy
    @diary.destroy

    respond_to do |format|
      format.html { redirect_to diaries_url, notice: "Diary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diary
      @diary = Diary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    #user_id追加？
    def diary_params
      params.require(:diary).permit(:title, :body, :image, :image_cache)
    end

  
end
