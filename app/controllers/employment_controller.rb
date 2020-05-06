# frozen_string_literal: true

class EmploymentController < ApplicationController
  before_action :set_employment, only: %i[show]
  before_action :set_user_employment, only: %i[edit update destroy]
  before_action :authenticate_user!, only: %i[new edit update destroy]

  def show; end

  def new
    @employment = current_user.employments.new
    @user = current_user
  end

  def edit; end

  def create
    @employment = current_user.employments.create(employment_params)

    respond_to do |format|
      if @employment.save
        format.html { redirect_to profile_path(current_user), notice: 'Employment was successfully created.' }
        format.json { render :show, status: :created, location: @employment }
      else
        format.html { render :new }
        format.json { render json: @employment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @employment.update(employment_params)
        format.html { redirect_to profile_path(current_user), notice: 'Employment was successfully updated.' }
        format.json { render :show, status: :ok, location: @employment }
      else
        format.html { render :edit }
        format.json { render json: @employment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employment.destroy
    respond_to do |format|
      format.html { redirect_to profile_path(current_user), notice: 'Employment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_employment
    @employment = Employment.find(params[:id])
  end

  # Allow only current user to make change
  def set_user_employment
    @employment = current_user.employments.find_by_id(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def employment_params
    params.require(:employment).permit(:position, :company, :start_year, :end_year, :currently)
  end
end
