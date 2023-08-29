# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /tasks or /tasks.json
  def index
    @pagy, @tasks = pagy(current_user.tasks.all, items: 10)
  end

  def card
    render partial: 'tasks/card', locals: { task: @task }
  end

  def show; end

  def new
    @task = current_user.tasks.build
  end

  def edit; end

  def create
    @task = current_user.tasks.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_url, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    # binding.pry
    if @task.destroy!
      redirect_to tasks_url, notice: 'Task was successfully destroyed.'
    else
      redirect_to tasks_url, alert: 'Error occurred while deleting the task.'
    end
    # @task.destroy!

    # respond_to do |format|
    #   format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:name, :content)
  end
end
