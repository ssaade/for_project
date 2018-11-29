Rails.application.routes.draw do
  # Routes for the Availability resource:

  # CREATE
  get("/availabilities/new", { :controller => "availabilities", :action => "new_form" })
  post("/create_availability", { :controller => "availabilities", :action => "create_row" })

  # READ
  get("/availabilities", { :controller => "availabilities", :action => "index" })
  get("/availabilities/:id_to_display", { :controller => "availabilities", :action => "show" })

  # UPDATE
  get("/availabilities/:prefill_with_id/edit", { :controller => "availabilities", :action => "edit_form" })
  post("/update_availability/:id_to_modify", { :controller => "availabilities", :action => "update_row" })

  # DELETE
  get("/delete_availability/:id_to_remove", { :controller => "availabilities", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
