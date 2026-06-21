# db/seeds.rb

puts "Seeding Forge Fitness App..."

workouts = [
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
      Did an extra set to implement some advice from ChatGPT.
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
]

workouts.each do |attrs|
  workout = Workout.find_or_initialize_by(date: attrs[:date], workout_type: attrs[:workout_type])
  workout.update!(attrs)
end

movements = [
  {
    name: "Back Squat",
    tag: "BackSquat",
    current_cue: "Traps into bar. Keep going lower than you think.",
    progression_rule: "Own 205 × 5×3 before moving up. Progress when depth and upper-back tightness are consistent.",
    notes: <<~NOTES
      Goal: build a high-quality path toward a 315 lb squat.

      Prioritize depth, upper-back tightness, and repeatable form over rushing weight increases.

      Recent notes:
      - 185 exposed depth limitations.
      - 195 initially felt tough, then became more solid.
      - 205 is currently a good challenge.
    NOTES
  },
  {
    name: "Bench Press",
    tag: "BenchPress",
    current_cue: "Stay tight. Control the descent. Press with clean reps.",
    progression_rule: "Hold 145 × 3×8 until all reps are clean, then consider adding weight.",
    notes: <<~NOTES
      Current working weight has been around 145 for 3×8.

      Long-term goal: 225 lb bench.

      Do not rush progression if shoulder/neck irritation is present.
    NOTES
  },
  {
    name: "Bent Over Row",
    tag: "BentOverRow",
    current_cue: "Brace hard. Pull with control. Avoid turning it into a heave.",
    progression_rule: "Stay at 145 × 3×8 until grip, torso position, and rep quality are consistent.",
    notes: <<~NOTES
      Current working weight has been around 145 for 3×8.

      Reduced reps from higher-rep sets to manage grip fatigue and keep the session tighter.
    NOTES
  },
  {
    name: "RDL",
    tag: "RDL",
    current_cue: "Hips back. Keep lats tight. Feel hamstrings without chasing range.",
    progression_rule: "Build from 175 × 3×10 with clean hinge mechanics and no low-back irritation.",
    notes: <<~NOTES
      Current recent work: 175 × 3×10.

      Watch low-back response due to prior low-right back pain after heavier deadlift work.
    NOTES
  },
  {
    name: "Sumo Deadlift",
    tag: "SumoDeadlift",
    current_cue: "Wedge in. Push the floor away. Keep the bar close.",
    progression_rule: "Progress only when setup, grip, and bar path feel repeatable.",
    notes: <<~NOTES
      Recent work included 5×5 @ 245.

      Grip and smooth bar center have been limiting factors. Chalk helps. Straps may be worth considering later.
    NOTES
  },
  {
    name: "Power Clean",
    tag: "PowerClean",
    current_cue: "Stay patient off the floor. Finish tall. Fast elbows.",
    progression_rule: "Prioritize crisp positions and speed before adding load.",
    notes: <<~NOTES
      Current known power clean max: 175 lb.

      Treat Olympic lift days as skill plus power, not ego lifting.
    NOTES
  },
  {
    name: "Overhead Squat",
    tag: "OverheadSquat",
    current_cue: "Own the position. Do not force range if neck or shoulders feel irritated.",
    progression_rule: "Use cautiously when neck/shoulders are stiff. Prioritize mobility and positions over load.",
    notes: <<~NOTES
      Neck and shoulders were wrecked two days after overhead squats/drop snatches.

      Looking up was the most uncomfortable movement afterward.

      Use this movement as a signal for mobility and recovery, not just strength.
    NOTES
  },
  {
    name: "Drop Snatch",
    tag: "DropSnatch",
    current_cue: "Fast under the bar. Stable overhead. Do not chase speed if shoulders feel off.",
    progression_rule: "Progress only when overhead position feels stable and recovery is good.",
    notes: <<~NOTES
      Related to prior neck/shoulder stiffness after overhead work.

      Be careful stacking this with other overhead movements if recovery is compromised.
    NOTES
  }
]

movements.each do |attrs|
  movement = Movement.find_or_initialize_by(name: attrs[:name])
  movement.update!(attrs)
end

puts "Seeded #{Workout.count} workouts."
puts "Seeded #{Movement.count} movements."
puts "Done."

# Exercise entry seed data

upper_body = Workout.find_or_create_by!(
  date: Date.new(2026, 6, 17),
  workout_type: "Upper Body"
) do |workout|
  workout.raw_notes = "Bench 3x8 @ 145\nRows 3x8 @ 145\nLateral raises 2x12 @ 15"
end

lower_body = Workout.find_or_create_by!(
  date: Date.new(2026, 6, 19),
  workout_type: "Lower Body"
) do |workout|
  workout.raw_notes = "Back squat 5x3 @ 205\nRDL 3x10 @ 175"
end

bench_press = Movement.find_or_create_by!(name: "Bench Press") do |movement|
  movement.tag = "Strength"
end

bent_over_row = Movement.find_or_create_by!(name: "Bent Over Row") do |movement|
  movement.tag = "Strength"
end

lateral_raise = Movement.find_or_create_by!(name: "Lateral Raise") do |movement|
  movement.tag = "Accessory"
end

back_squat = Movement.find_or_create_by!(name: "Back Squat") do |movement|
  movement.tag = "Strength"
end

romanian_deadlift = Movement.find_or_create_by!(name: "Romanian Deadlift") do |movement|
  movement.tag = "Strength"
end

ExerciseEntry.find_or_create_by!(
  workout: upper_body,
  movement: bench_press,
  position: 1
) do |entry|
  entry.sets = 3
  entry.reps = 8
  entry.weight = 145
end

ExerciseEntry.find_or_create_by!(
  workout: upper_body,
  movement: bent_over_row,
  position: 2
) do |entry|
  entry.sets = 3
  entry.reps = 8
  entry.weight = 145
end

ExerciseEntry.find_or_create_by!(
  workout: upper_body,
  movement: lateral_raise,
  position: 3
) do |entry|
  entry.sets = 2
  entry.reps = 12
  entry.weight = 15
end

ExerciseEntry.find_or_create_by!(
  workout: lower_body,
  movement: back_squat,
  position: 1
) do |entry|
  entry.sets = 5
  entry.reps = 3
  entry.weight = 205
end

ExerciseEntry.find_or_create_by!(
  workout: lower_body,
  movement: romanian_deadlift,
  position: 2
) do |entry|
  entry.sets = 3
  entry.reps = 10
  entry.weight = 175
end

puts "Seeding exercise entries..."

def find_or_update_movement!(name:, tag:)
  movement = Movement.find_or_initialize_by(name: name)
  movement.tag = tag if movement.respond_to?(:tag=)
  movement.save!
  movement
end

def find_or_update_workout!(date:, workout_type:, raw_notes:)
  workout = Workout.find_or_initialize_by(date: date, workout_type: workout_type)
  workout.raw_notes = raw_notes
  workout.save!
  workout
end

def find_or_update_exercise_entry!(workout:, movement:, position:, sets:, reps:, weight:, notes: nil)
  entry = ExerciseEntry.find_or_initialize_by(
    workout: workout,
    movement: movement,
    position: position
  )

  entry.assign_attributes(
    sets: sets,
    reps: reps,
    weight: weight,
    notes: notes
  )

  entry.save!
  entry
end

bench_press = find_or_update_movement!(name: "Bench Press", tag: "Strength")
bent_over_row = find_or_update_movement!(name: "Bent Over Row", tag: "Strength")
lateral_raise = find_or_update_movement!(name: "Lateral Raise", tag: "Accessory")
back_squat = find_or_update_movement!(name: "Back Squat", tag: "Strength")
romanian_deadlift = find_or_update_movement!(name: "Romanian Deadlift", tag: "Strength")
goblet_squat = find_or_update_movement!(name: "Goblet Squat", tag: "Strength")
step_up = find_or_update_movement!(name: "Step Up", tag: "Accessory")
tibialis_raise = find_or_update_movement!(name: "Tibialis Raise", tag: "Accessory")

upper_body = find_or_update_workout!(
  date: Date.new(2026, 6, 17),
  workout_type: "Upper Body",
  raw_notes: "Bench Press 3x8 @ 145\nBent Over Row 3x8 @ 145\nLateral Raise 2x12 @ 15"
)

lower_body = find_or_update_workout!(
  date: Date.new(2026, 6, 19),
  workout_type: "Lower Body",
  raw_notes: "Back Squat 5x3 @ 205\nRomanian Deadlift 3x10 @ 175"
)

accessory_lower = find_or_update_workout!(
  date: Date.new(2026, 6, 20),
  workout_type: "Lower Accessory",
  raw_notes: "Goblet Squat 3x10\nStep Ups 2x10 per leg\nTibialis Raises 2x15"
)

find_or_update_exercise_entry!(
  workout: upper_body,
  movement: bench_press,
  position: 1,
  sets: 3,
  reps: 8,
  weight: 145,
  notes: "Solid working weight."
)

find_or_update_exercise_entry!(
  workout: upper_body,
  movement: bent_over_row,
  position: 2,
  sets: 3,
  reps: 8,
  weight: 145,
  notes: "Keep torso angle consistent."
)

find_or_update_exercise_entry!(
  workout: upper_body,
  movement: lateral_raise,
  position: 3,
  sets: 2,
  reps: 12,
  weight: 15,
  notes: "Controlled reps."
)

find_or_update_exercise_entry!(
  workout: lower_body,
  movement: back_squat,
  position: 1,
  sets: 5,
  reps: 3,
  weight: 205,
  notes: "Focus on depth and bracing."
)

find_or_update_exercise_entry!(
  workout: lower_body,
  movement: romanian_deadlift,
  position: 2,
  sets: 3,
  reps: 10,
  weight: 175,
  notes: "Grip got tired near the end."
)

find_or_update_exercise_entry!(
  workout: accessory_lower,
  movement: goblet_squat,
  position: 1,
  sets: 3,
  reps: 10,
  weight: 53,
  notes: "24kg kettlebell."
)

find_or_update_exercise_entry!(
  workout: accessory_lower,
  movement: step_up,
  position: 2,
  sets: 2,
  reps: 10,
  weight: 0,
  notes: "Per leg."
)

find_or_update_exercise_entry!(
  workout: accessory_lower,
  movement: tibialis_raise,
  position: 3,
  sets: 2,
  reps: 15,
  weight: 0,
  notes: "Controlled tempo."
)

puts "Seeded #{ExerciseEntry.count} exercise entries."