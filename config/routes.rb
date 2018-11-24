Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "workouts#index"
  # Routes for the Performance resource:

  # CREATE
  get("/performances/new", { :controller => "performances", :action => "new_form" })
  post("/create_performance", { :controller => "performances", :action => "create_row" })

  # READ
  get("/performances", { :controller => "performances", :action => "index" })
  get("/performances/:id_to_display", { :controller => "performances", :action => "show" })

  # UPDATE
  get("/performances/:prefill_with_id/edit", { :controller => "performances", :action => "edit_form" })
  post("/update_performance/:id_to_modify", { :controller => "performances", :action => "update_row" })

  # DELETE
  get("/delete_performance/:id_to_remove", { :controller => "performances", :action => "destroy_row" })
  get("/delete_performance_from_exercise/:id_to_remove", { :controller => "performances", :action => "destroy_row_from_exercise" })
  get("/delete_performance_from_workout/:id_to_remove", { :controller => "performances", :action => "destroy_row_from_workout" })

  #------------------------------

  # Routes for the Exercise resource:

  # CREATE
  get("/exercises/new", { :controller => "exercises", :action => "new_form" })
  post("/create_exercise", { :controller => "exercises", :action => "create_row" })

  # READ
  get("/exercises", { :controller => "exercises", :action => "index" })
  get("/exercises/:id_to_display", { :controller => "exercises", :action => "show" })

  # UPDATE
  get("/exercises/:prefill_with_id/edit", { :controller => "exercises", :action => "edit_form" })
  post("/update_exercise/:id_to_modify", { :controller => "exercises", :action => "update_row" })

  # DELETE
  get("/delete_exercise/:id_to_remove", { :controller => "exercises", :action => "destroy_row" })

  #------------------------------

  # Routes for the Workout resource:

  # CREATE
  get("/workouts/new", { :controller => "workouts", :action => "new_form" })
  post("/create_workout", { :controller => "workouts", :action => "create_row" })

  # READ
  get("/workouts", { :controller => "workouts", :action => "index" })
  get("/workouts/:id_to_display", { :controller => "workouts", :action => "show" })

  # UPDATE
  get("/workouts/:prefill_with_id/edit", { :controller => "workouts", :action => "edit_form" })
  post("/update_workout/:id_to_modify", { :controller => "workouts", :action => "update_row" })

  # DELETE
  get("/delete_workout/:id_to_remove", { :controller => "workouts", :action => "destroy_row" })
  get("/delete_workout_from_user/:id_to_remove", { :controller => "workouts", :action => "destroy_row_from_user" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
