class JobsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  before_action :find_job_and_check_permission, only: [:edit, :update, :destroy]
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
    @posts = @job.posts.recent.paginate(:page => params[:page], :per_page => 5)
  end

  def edit
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user

    if @job.save

    redirect_to jobs_path
  else
    render :new
  end
 end

  def update
    if @job.update(job_params)
      redirect_to jobs_path, notice: "修改 成功"
    else
    render :edit
    end
  end

  def destroy
    @job.destroy
    flash[:alert] = "职缺 删除"
    redirect_to jobs_path
  end

  def join
    @job = Job.find(params[:id])

    if !current_user.is_member_of?(@job)
      current_user.join!(@job)
      flash[:notice] = "加入本讨论版成功！"
    else
      flash[:warning] = "你已经是本讨论版成员了！"
    end

    redirect_to job_path(@job)
  end

  def quit
    @job = Job.find(params[:id])

    if current_user.is_member_of?(@job)
      current_user.quit!(@job)
      flash[:alert] = "已退出本讨论版！"
    else
      flash[:warning] = "你不是本讨论版成员，怎么退出 "
    end

    redirect_to job_path(@job)
  end

  private

  def find_job_and_check_permission
    @job = Job.find(params[:id])

  if current_user != @job.user
    redirect_to root_path, alert: "You have no permission."
  end
end

  def job_params
    params.require(:job).permit(:职缺, :岗位描述)
  end
end
