class PerformancesController < ApplicationController
  def index
    @performances = Performance.all

    render("performance_templates/index.html.erb")
  end

  def show
    @performance = Performance.find(params.fetch("id_to_display"))

    render("performance_templates/show.html.erb")
  end

  def new_form
    @performance = Performance.new

    render("performance_templates/new_form.html.erb")
  end

  def create_row
    @performance = Performance.new

    @performance.workout_id = params.fetch("workout_id")
    @performance.reps = params.fetch("reps")
    @performance.sets = params.fetch("sets")
    @performance.weight = params.fetch("weight")
    @performance.exercise_id = params.fetch("exercise_id")

    if @performance.valid?
      @performance.save

      redirect_back(:fallback_location => "/performances", :notice => "Performance created successfully.")
    else
      render("performance_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @performance = Performance.find(params.fetch("prefill_with_id"))

    render("performance_templates/edit_form.html.erb")
  end

  def update_row
    @performance = Performance.find(params.fetch("id_to_modify"))

    @performance.workout_id = params.fetch("workout_id")
    @performance.reps = params.fetch("reps")
    @performance.sets = params.fetch("sets")
    @performance.weight = params.fetch("weight")
    @performance.exercise_id = params.fetch("exercise_id")

    if @performance.valid?
      @performance.save

      redirect_to("/performances/#{@performance.id}", :notice => "Performance updated successfully.")
    else
      render("performance_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @performance = Performance.find(params.fetch("id_to_remove"))

    @performance.destroy

    redirect_to("/performances", :notice => "Performance deleted successfully.")
  end
end
