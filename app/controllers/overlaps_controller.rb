class OverlapsController < ApplicationController
  def index
    @overlaps = Overlap.page(params[:page]).per(10)

    render("overlap_templates/index.html.erb")
  end

  def show
    @overlap = Overlap.find(params.fetch("id_to_display"))

    render("overlap_templates/show.html.erb")
  end

  def new_form
    @overlap = Overlap.new

    render("overlap_templates/new_form.html.erb")
  end

  def create_row
    @overlap = Overlap.new

    @overlap.inviter_id = params.fetch("inviter_id")
    @overlap.invited_id = params.fetch("invited_id")
    @overlap.date = params.fetch("date")
    @overlap.start_time = params.fetch("start_time")
    @overlap.end_time = params.fetch("end_time")

    if @overlap.valid?
      @overlap.save

      redirect_back(:fallback_location => "/overlaps", :notice => "Overlap created successfully.")
    else
      render("overlap_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @overlap = Overlap.find(params.fetch("prefill_with_id"))

    render("overlap_templates/edit_form.html.erb")
  end

  def update_row
    @overlap = Overlap.find(params.fetch("id_to_modify"))

    @overlap.inviter_id = params.fetch("inviter_id")
    @overlap.invited_id = params.fetch("invited_id")
    @overlap.date = params.fetch("date")
    @overlap.start_time = params.fetch("start_time")
    @overlap.end_time = params.fetch("end_time")

    if @overlap.valid?
      @overlap.save

      redirect_to("/overlaps/#{@overlap.id}", :notice => "Overlap updated successfully.")
    else
      render("overlap_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_firstuser
    @overlap = Overlap.find(params.fetch("id_to_remove"))

    @overlap.destroy

    redirect_to("/users/#{@overlap.inviter_id}", notice: "Overlap deleted successfully.")
  end

  def destroy_row_from_seconduser
    @overlap = Overlap.find(params.fetch("id_to_remove"))

    @overlap.destroy

    redirect_to("/users/#{@overlap.invited_id}", notice: "Overlap deleted successfully.")
  end

  def destroy_row
    @overlap = Overlap.find(params.fetch("id_to_remove"))

    @overlap.destroy

    redirect_to("/overlaps", :notice => "Overlap deleted successfully.")
  end
end
