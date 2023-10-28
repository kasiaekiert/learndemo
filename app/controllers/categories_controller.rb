# frozen_string_literal: true

class TasksController < ApplicationController
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def category_params_params
    params.require(:category).permit(:name)
  end
end
