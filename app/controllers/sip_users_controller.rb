class SipUsersController < ApplicationController
  before_action :set_sip_user, only: [:show, :edit, :update, :destroy]

  # GET /sip_users
  # GET /sip_users.json
  def index
    @sip_users = SipUser.all
  end

  # GET /sip_users/1
  # GET /sip_users/1.json
  def show
    unless subdivisions
  end

  # GET /sip_users/new
  def new
    @sip_user = SipUser.new
  end

  # GET /sip_users/1/edit
  def edit
  end

  # POST /sip_users
  # POST /sip_users.json
  def create
    @sip_user = SipUser.new(sip_user_params)

    respond_to do |format|
      if @sip_user.save
        format.html { redirect_to @sip_user, notice: 'Sip user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sip_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @sip_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sip_users/1
  # PATCH/PUT /sip_users/1.json
  def update
    respond_to do |format|
      if @sip_user.update(sip_user_params)
        format.html { redirect_to @sip_user, notice: 'Sip user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sip_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sip_users/1
  # DELETE /sip_users/1.json
  def destroy
    @sip_user.destroy
    respond_to do |format|
      format.html { redirect_to sip_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sip_user
      @sip_user = SipUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sip_user_params
      params.require(:sip_user).permit(:name, :callerid, :username, :telephon_type, :podrazdelenie)
    end
end
