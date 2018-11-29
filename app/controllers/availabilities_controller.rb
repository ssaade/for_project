class AvailabilitiesController < ApplicationController
  def index
    @availabilities = Availability.all

    render("availability_templates/index.html.erb")
  end

  def show
    @availability = Availability.find(params.fetch("id_to_display"))

    render("availability_templates/show.html.erb")
  end

  def new_form
    @availability = Availability.new

    render("availability_templates/new_form.html.erb")
  end

  def create_row
    @availability = Availability.new

    @availability.user_id = params.fetch("user_id")
    @availability.date = params.fetch("date")
    @availability.start_time = params.fetch("start_time")
    @availability.end_time = params.fetch("end_time")

    if @availability.valid?
      @availability.save

      redirect_back(:fallback_location => "/availabilities", :notice => "Availability created successfully.")
    else
      render("availability_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @availability = Availability.find(params.fetch("prefill_with_id"))

    render("availability_templates/edit_form.html.erb")
  end

  def update_row
    @availability = Availability.find(params.fetch("id_to_modify"))

    
    @availability.date = params.fetch("date")
    @availability.start_time = params.fetch("start_time")
    @availability.end_time = params.fetch("end_time")

    if @availability.valid?
      @availability.save

      redirect_to("/availabilities/#{@availability.id}", :notice => "Availability updated successfully.")
    else
      render("availability_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @availability = Availability.find(params.fetch("id_to_remove"))

    @availability.destroy

    redirect_to("/users/#{@availability.user_id}", notice: "Availability deleted successfully.")
  end

  def destroy_row
    @availability = Availability.find(params.fetch("id_to_remove"))

    @availability.destroy

    redirect_to("/availabilities", :notice => "Availability deleted successfully.")
  end
end
