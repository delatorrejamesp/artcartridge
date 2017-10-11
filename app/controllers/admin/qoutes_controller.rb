class Admin::QoutesController < ApplicationController
  before_action :set_admin_qoute, only: [:show, :edit, :update, :destroy]

  # GET /admin/qoutes
  # GET /admin/qoutes.json
  def index
    @admin_qoutes = Admin::Qoute.all
  end

  # GET /admin/qoutes/1
  # GET /admin/qoutes/1.json
  def show
  end

  # GET /admin/qoutes/new
  def new
    @admin_qoute = Admin::Qoute.new
  end

  # GET /admin/qoutes/1/edit
  def edit
  end

  # POST /admin/qoutes
  # POST /admin/qoutes.json
  def create
    @admin_qoute = Admin::Qoute.new(admin_qoute_params)

    respond_to do |format|
      if @admin_qoute.save
        format.html { redirect_to @admin_qoute, notice: 'Qoute was successfully created.' }
        format.json { render :show, status: :created, location: @admin_qoute }
      else
        format.html { render :new }
        format.json { render json: @admin_qoute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/qoutes/1
  # PATCH/PUT /admin/qoutes/1.json
  def update
    respond_to do |format|
      if @admin_qoute.update(admin_qoute_params)
        format.html { redirect_to @admin_qoute, notice: 'Qoute was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_qoute }
      else
        format.html { render :edit }
        format.json { render json: @admin_qoute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/qoutes/1
  # DELETE /admin/qoutes/1.json
  def destroy
    @admin_qoute.destroy
    respond_to do |format|
      format.html { redirect_to admin_qoutes_url, notice: 'Qoute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /admin/settings/:id/random
  def random
    @admin_qoutes = @setting.qoutes.limit(10).order("RANDOM()")
    #render @qoutes
    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_qoute
      @admin_qoute = Admin::Qoute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_qoute_params
      params.require(:admin_qoute).permit(:description, :enable, :setting_id)
    end

    def get_setting_id
      setting_id = admin_qoute_params[:setting_id] || params[:setting_id]
      @setting =  Admin::Setting.find(setting_id)
    end
end
