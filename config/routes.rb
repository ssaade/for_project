Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "availabilities#index"
  # Routes for the Overlap resource:

  # CREATE
  get("/overlaps/new", { :controller => "overlaps", :action => "new_form" })
  post("/create_overlap", { :controller => "overlaps", :action => "create_row" })

  # READ
  get("/overlaps", { :controller => "overlaps", :action => "index" })
  get("/overlaps/:id_to_display", { :controller => "overlaps", :action => "show" })

  # UPDATE
  get("/overlaps/:prefill_with_id/edit", { :controller => "overlaps", :action => "edit_form" })
  post("/update_overlap/:id_to_modify", { :controller => "overlaps", :action => "update_row" })

  # DELETE
  get("/delete_overlap/:id_to_remove", { :controller => "overlaps", :action => "destroy_row" })
  get("/delete_overlap_from_seconduser/:id_to_remove", { :controller => "overlaps", :action => "destroy_row_from_seconduser" })
  get("/delete_overlap_from_firstuser/:id_to_remove", { :controller => "overlaps", :action => "destroy_row_from_firstuser" })

  #------------------------------

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
  get("/delete_availability_from_user/:id_to_remove", { :controller => "availabilities", :action => "destroy_row_from_user" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
