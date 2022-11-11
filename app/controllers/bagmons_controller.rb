class BagmonsController < ApplicationController
  before_action :set_bagmon, only: %i[ show edit update destroy ]
  before_action :set_type_options, only: %i[ create new edit update ]

  def set_type_options
    @type_options = Type.all.pluck(:name, :id)
  end

  # GET /bagmons or /bagmons.json
  def index
    @bagmons = Bagmon.order(:number)
  end

  # GET /bagmons/1 or /bagmons/1.json
  def show
  end

  # GET /bagmons/new
  def new
    @bagmon = Bagmon.new
  end

  # GET /bagmons/1/edit
  def edit
  end

  # POST /bagmons or /bagmons.json
  def create
    @bagmon = Bagmon.new(bagmon_params)

    respond_to do |format|
      if @bagmon.save
        format.html { redirect_to bagmon_url(@bagmon), notice: "Bagmon was successfully created." }
        format.json { render :show, status: :created, location: @bagmon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bagmon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bagmons/1 or /bagmons/1.json
  def update
    respond_to do |format|
      if @bagmon.update(bagmon_params)
        format.html { redirect_to bagmon_url(@bagmon), notice: "Bagmon was successfully updated." }
        format.json { render :show, status: :ok, location: @bagmon }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bagmon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bagmons/1 or /bagmons/1.json
  def destroy
    @bagmon.destroy

    respond_to do |format|
      format.html { redirect_to bagmons_url, notice: "Bagmon was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bagmon
      @bagmon = Bagmon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bagmon_params
      params.require(:bagmon).permit(:number, :name, :image, :type_id)
    end
end