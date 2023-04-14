class MealPlanningsController < ApplicationController
  before_action :set_meal_planning, only: %i[ show edit update destroy ]

  # GET /meal_plannings or /meal_plannings.json
  def index
    @meal_plannings = MealPlanning.all
  end

  # GET /meal_plannings/1 or /meal_plannings/1.json
  def show
  end

  # GET /meal_plannings/new
  def new
    @meal_planning = MealPlanning.new
  end

  # GET /meal_plannings/1/edit
  def edit
  end

  # POST /meal_plannings or /meal_plannings.json
  def create
    @meal_planning = MealPlanning.new(meal_planning_params)

    respond_to do |format|
      if @meal_planning.save
        format.html { redirect_to meal_planning_url(@meal_planning), notice: "Meal planning was successfully created." }
        format.json { render :show, status: :created, location: @meal_planning }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meal_planning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meal_plannings/1 or /meal_plannings/1.json
  def update
    respond_to do |format|
      if @meal_planning.update(meal_planning_params)
        format.html { redirect_to meal_planning_url(@meal_planning), notice: "Meal planning was successfully updated." }
        format.json { render :show, status: :ok, location: @meal_planning }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meal_planning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meal_plannings/1 or /meal_plannings/1.json
  def destroy
    @meal_planning.destroy

    respond_to do |format|
      format.html { redirect_to meal_plannings_url, notice: "Meal planning was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal_planning
      @meal_planning = MealPlanning.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meal_planning_params
      params.require(:meal_planning).permit(:title, :start_date, :end_date)
    end
end
