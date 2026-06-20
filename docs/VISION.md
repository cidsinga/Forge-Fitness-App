# Forge Fitness App — Vision

## Purpose

Forge Fitness App helps me become the kind of person who consistently does the things I value.

The first version is a personal workout logging app. Over time, it may become an identity-based fitness and habit system that connects workout history, habit consistency, body notes, visual trends, and AI-assisted coaching.

Fitness is the proving ground. Identity is the deeper product.

## Core Problem

I currently track workouts in Apple Notes. This works for simple logging, but it does not make it easy to:

* See progression over time
* Review exercise history
* Refer to previous notes before beginning a workout
* Connect training notes to programming decisions
* Preserve coaching cues from conversations
* Notice patterns in pain, fatigue, consistency, and habit drift
* Generate useful weekly reviews
* Visualize trends over time
* Preserve context for AI-assisted coaching

Forge exists to turn scattered workout notes into structured training history and usable evidence of growth.

## Core Idea

Forge should track two kinds of evidence:

1. Training Evidence
   Workouts, movements, sets, reps, weights, notes, cues, progression, and recovery context.

2. Identity Evidence
   Walks, protein-first meals, no-zero-day actions, non-negotiable behaviors, consistency wins, and other proof that I am becoming the person I intend to be.

Workout data shows physical progression.
Habit data shows identity progression.

Together, they help answer:

> Am I becoming the person I intend to be?

## Version 1 Goal

Replace my current Apple Notes workout log with a simple Rails app I actually want to use.

Version 1 should let me:

* Create a workout
* Add the workout date
* Add a workout type
* Add raw workout notes
* View a list of past workouts
* View an individual workout

## Version 1 Is Not

Version 1 is not:

* An AI coach
* A social fitness app
* A commercial SaaS product
* A nutrition tracker
* A wearable integration
* A local AI experiment
* A complex analytics dashboard
* A replacement for human judgment or medical advice

## Design Principle

The app should be easier than Apple Notes.

If logging a workout feels slower, more annoying, or more fragile than Apple Notes, the app has failed.

## Product Direction

Forge should eventually have three main areas:

### Today

The Today view helps me act right now.

It may eventually show:

* Start workout
* Recent workouts
* Current movement cues
* Previous notes for today’s movements
* Suggested focus
* Quick habit checkboxes
* Today’s proof

### Movements

The Movements view helps me understand my history with a specific lift or movement.

It may eventually show:

* Movement history
* Recent working weights
* Notes by movement
* Active coaching cues
* Progression rules
* Personal records
* Volume trends
* Pain or recovery notes connected to the movement

### Review

The Review view helps me see patterns over time.

It may eventually show:

* Workouts per week
* Main lift trends
* Habit consistency
* Identity wins
* Pain/recovery patterns
* Weekly reviews
* Visual dashboards

## Dashboard Philosophy

Forge dashboards should answer three questions:

1. What should I do today?
2. Am I becoming stronger and more consistent over time?
3. What evidence have I collected that I am becoming the person I intend to be?

Dashboards should not exist just to display data. They should help me make better decisions.

## Long-Term Direction

Possible future features include:

* Exercise-specific history
* Movement-specific dashboards
* Personal records
* Weekly reviews
* Habit tracking
* Pain and recovery notes
* AI parsing of messy workout notes
* AI-assisted programming recommendations
* Identity-based habit review
* Visual trend charts
* Deployment to a Synology NAS or web host

## North Star

Every workout, walk, protein-first meal, and non-negotiable action is evidence.

Forge should help me collect proof of who I am becoming.
