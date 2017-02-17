class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.save

    redirect_to jobs_path
  end

  def update
    @job = Job.find(params[:id])

    @job.update(job_params)

    redirect_to jobs_path, notice: "Update Success"
  end

  private

  def job_params
    params.require(:job).permit(:职缺, :岗位描述)
  end
end
