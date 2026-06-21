class WorkoutsController < ApplicationController
  before_action :set_workout, only: %i[show edit update destroy]

  # GET /workouts or /workouts.json
  def index
    @workouts = Workout.all
  end

  # GET /workouts/1 or /workouts/1.json
  def show
  end

  # GET /workouts/new
  def new
    @workout = Workout.new(date: Date.current)
    build_empty_exercise_entries
  end

  # GET /workouts/1/edit
  def edit
    build_empty_exercise_entries
  end

  # POST /workouts or /workouts.json
  def create
    @workout = Workout.new(workout_params)

    respond_to do |format|
      if @workout.save
        format.html { redirect_to @workout, notice: "Workout was successfully created." }
        format.json { render :show, status: :created, location: @workout }
      else
        build_empty_exercise_entries
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @workout.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /workouts/1 or /workouts/1.json
  def update
    respond_to do |format|
      if @workout.update(workout_params)
        format.html { redirect_to @workout, notice: "Workout was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @workout }
      else
        build_empty_exercise_entries
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @workout.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /workouts/1 or /workouts/1.json
  def destroy
    @workout.destroy!

    respond_to do |format|
      format.html { redirect_to workouts_path, notice: "Workout was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_workout
    @workout = Workout.find(params.expect(:id))
  end

  def build_empty_exercise_entries
    @workout.exercise_entries.build if @workout.exercise_entries.empty?
  end

  def workout_params
    params.expect(workout: [
      :date,
      :workout_type,
      :raw_notes,
      exercise_entries_attributes: [
        :id,
        :movement_id,
        :sets,
        :reps,
        :weight,
        :notes,
        :position,
        :_destroy
      ]
    ])
  end
end