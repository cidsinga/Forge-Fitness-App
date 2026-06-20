class ExerciseEntriesController < ApplicationController
  before_action :set_workout
  before_action :set_exercise_entry, only: [:edit, :update, :destroy]

  def new
    @exercise_entry = @workout.exercise_entries.build
  end

  def create
    @exercise_entry = @workout.exercise_entries.build(exercise_entry_params)

    if @exercise_entry.save
      redirect_to @workout, notice: "Exercise entry was added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @exercise_entry.update(exercise_entry_params)
      redirect_to @workout, notice: "Exercise entry was updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @exercise_entry.destroy
    redirect_to @workout, notice: "Exercise entry was removed."
  end

  private

  def set_workout
    @workout = Workout.find(params[:workout_id])
  end

  def set_exercise_entry
    @exercise_entry = @workout.exercise_entries.find(params[:id])
  end

  def exercise_entry_params
    params.require(:exercise_entry).permit(
      :movement_id,
      :sets,
      :reps,
      :weight,
      :notes,
      :position
    )
  end
end