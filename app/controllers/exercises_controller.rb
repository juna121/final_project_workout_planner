class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.page(params[:page]).per(10)

    render("exercise_templates/index.html.erb")
  end

  def show
    @performance = Performance.new
    @exercise = Exercise.find(params.fetch("id_to_display"))

    render("exercise_templates/show.html.erb")
  end

  def new_form
    @exercise = Exercise.new

    render("exercise_templates/new_form.html.erb")
  end

  def create_row
    @exercise = Exercise.new

    @exercise.name = params.fetch("name")
    @exercise.muscle = params.fetch("muscle")

    if @exercise.valid?
      @exercise.save

      redirect_back(:fallback_location => "/exercises", :notice => "Exercise created successfully.")
    else
      render("exercise_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @exercise = Exercise.find(params.fetch("prefill_with_id"))

    render("exercise_templates/edit_form.html.erb")
  end

  def update_row
    @exercise = Exercise.find(params.fetch("id_to_modify"))

    @exercise.name = params.fetch("name")
    @exercise.muscle = params.fetch("muscle")

    if @exercise.valid?
      @exercise.save

      redirect_to("/exercises/#{@exercise.id}", :notice => "Exercise updated successfully.")
    else
      render("exercise_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @exercise = Exercise.find(params.fetch("id_to_remove"))

    @exercise.destroy

    redirect_to("/exercises", :notice => "Exercise deleted successfully.")
  end
end
