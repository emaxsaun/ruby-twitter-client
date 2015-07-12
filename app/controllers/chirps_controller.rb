class ChirpsController < ApplicationController
  #before_action :set_chirp, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def awesome
    @chirp = Chirp.first
  end

  # GET /chirps
  def index
    @chirps = Chirp.all
  end

  # GET /chirps/1
  def show
    begin
      @chirp = Chirp.find(params[:id])
    rescue
        redirect_to chirps_path, note: "No record found."
    end
  end

  # GET /chirps/new
  def new
    @chirp = Chirp.new
  end

  # GET /chirps/1/edit
  def edit
    begin
      @chirp = Chirp.find(params[:id])
    rescue
        redirect_to chirps_path, note: "No record found."
    end
  end

  # POST /chirps
  def create
    @chirp = Chirp.new(chirp_params)

    if @chirp.save
      redirect_to @chirp, notice: 'Chirp was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /chirps/1
  def update
    @chirp = Chirp.find(params[:id])
    if @chirp.update(chirp_params)
      redirect_to @chirp, notice: 'Chirp was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /chirps/1
  def destroy
    @chirp = Chirp.find(params[:id])
    @chirp.destroy
    redirect_to chirps_url, notice: 'Chirp was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_chirp
      #@chirp = Chirp.find(params[:id])
    #end

    # Only allow a trusted parameter "white list" through.
    def chirp_params
      params.require(:chirp).permit(:body, :user_id).merge(user: current_user)
    end
end