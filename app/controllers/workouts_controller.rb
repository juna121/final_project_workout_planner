class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all

    render("workout_templates/index.html.erb")
  end

  def show
    @workout = Workout.find(params.fetch("id_to_display"))

    render("workout_templates/show.html.erb")
  end

  def new_form
    @workout = Workout.new

    render("workout_templates/new_form.html.erb")
  end

  def create_row
    @workout = Workout.new

    @workout.date = params.fetch("date")
    @workout.user_id = params.fetch("user_id")

    if @workout.valid?
      @workout.save

      redirect_back(:fallback_location => "/workouts", :notice => "Workout created successfully.")
    else
      render("workout_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @workout = Workout.find(params.fetch("prefill_with_id"))

    render("workout_templates/edit_form.html.erb")
  end

  def update_row
    @workout = Workout.find(params.fetch("id_to_modify"))

    @workout.date = params.fetch("date")
    @workout.user_id = params.fetch("user_id")

    if @workout.valid?
      @workout.save

      redirect_to("/workouts/#{@workout.id}", :notice => "Workout updated successfully.")
    else
      render("workout_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @workout = Workout.find(params.fetch("id_to_remove"))

    @workout.destroy

    redirect_to("/users/#{@workout.user_id}", notice: "Workout deleted successfully.")
  end

  def destroy_row
    @workout = Workout.find(params.fetch("id_to_remove"))

    @workout.destroy

    redirect_to("/workouts", :notice => "Workout deleted successfully.")
  end
end
