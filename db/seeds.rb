Workout.destroy_all

Workout.create!([
  {
    date: Date.new(2026, 5, 9),
    workout_type: "Lower",
    raw_notes: <<~NOTES
      #BackSquat
      3x5 @ 185

      That was a tough-ish weight when going appropriately low.
    NOTES
  },
  {
    date: Date.new(2026, 5, 15),
    workout_type: "Lower",
    raw_notes: <<~NOTES
      #BackSquat
      5x3 @ 195

      Toughish weight. Especially at the last set or two.
    NOTES
  },
  {
    date: Date.new(2026, 6, 2),
    workout_type: "Lower",
    raw_notes: <<~NOTES
      #BackSquat
      6x3 @ 195

      Good weight. Maybe bump it up next time.
      When you think you're in the bottom... keep going lol.
      Did an extra set to implement some advice from chat.
    NOTES
  },
  {
    date: Date.new(2026, 6, 13),
    workout_type: "Lower",
    raw_notes: <<~NOTES
      #BackSquat
      5x3 @ 205

      205 is a good challenge.
      Nail the technique at this weight.
      Cue: traps into bar.

      #RDL
      3x10 @ 175

      Garage session was around 45-55 minutes.
      Warmed up with air squats, step-ups, hip circles, and Asian squat.
    NOTES
  },
  {
    date: Date.new(2026, 6, 18),
    workout_type: "Upper",
    raw_notes: <<~NOTES
      #BenchPress
      3x8 @ 145

      Working weight feels appropriate.
      Hold here until all reps are clean.

      #BentOverRow
      3x8 @ 145

      Same working weight as bench.
      Reduced reps to manage grip fatigue.

      #LateralRaise
      2x12 @ 15
    NOTES
  }
])