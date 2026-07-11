class MovementsController < ApplicationController
  before_action :set_movement, only: %i[ show edit update destroy ]

  # GET /movements or /movements.json
  def index
    @movements = Movement.all
  end

  # GET /movements/1 or /movements/1.json
def show
  @recent_exercise_entries =
    @movement
      .exercise_entries
      .includes(:workout, :exercise_sets)
      .joins(:workout)
      .order("workouts.date DESC, exercise_entries.position ASC, exercise_entries.created_at DESC")
      .limit(3)
end

  # GET /movements/new
  def new
    @movement = Movement.new
  end

  # GET /movements/1/edit
  def edit
  end

  # POST /movements or /movements.json
  def create
    @movement = Movement.new(movement_params)

    respond_to do |format|
      if @movement.save
        format.html { redirect_to @movement, notice: "Movement was successfully created." }
        format.json { render :show, status: :created, location: @movement }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @movement.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /movements/1 or /movements/1.json
  def update
    respond_to do |format|
      if @movement.update(movement_params)
        format.html { redirect_to @movement, notice: "Movement was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @movement }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @movement.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /movements/1 or /movements/1.json
  def destroy
  @movement.destroy!

  redirect_to movements_path,
    notice: "Movement was successfully deleted.",
    status: :see_other
rescue ActiveRecord::RecordNotDestroyed, ActiveRecord::DeleteRestrictionError, ActiveRecord::InvalidForeignKey
  redirect_to movement_path(@movement),
    alert: "This movement cannot be deleted because it is used by existing workout entries.",
    status: :see_other
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movement
      @movement = Movement.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def movement_params
      params.expect(movement: [ :name, :tag, :current_cue, :progression_rule, :notes ])
    end
end
