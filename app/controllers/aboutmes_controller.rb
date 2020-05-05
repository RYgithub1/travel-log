class AboutmesController < ApplicationController

  def index
    # @abouts = Aboutme.all
    @abouts = Aboutme.includes(:user).all

  end
  def new
    @about = Aboutme.new
    # @about.user = current_user
    # @about.users << current_user
  end


  def create
    @about = Aboutme.new(about_params)
      if @about.save
          redirect_to aboutmes_path, notice: "新規About作成成功！"
      else
        redirect_to new_aboutme_path, notice: "再作成してください"
      end

    # Aboutme.create(about_params)
    # @about = Aboutme.new(about_params)
    # @about.user = current_user
    # @about = Aboutme.create(about_params)
    # redirect_to aboutmes_path
    # @project = Project.new(project_params)  # put into the data from form
    # @project.save
    # redirect_to projects_path

  end

  def show
    @about = Aboutme.find(params[:id])
  end

  def edit
    @about = Aboutme.find(params[:id])
  end
  def update
    about = Aboutme.find(params[:id])
    about.update(about_params)
    redirect_to aboutme_path(about.id)


  end

  def destroy
    about = Aboutme.find(params[:id])
    about.destroy
    redirect_to aboutmes_path
  end


  private
  def about_params
    # params.permit(:content, :image, :url)
    # params.require(:aboutme).permit(:content, :image, :url)
    params.require(:aboutme).permit(:content, :image, :url).merge(user_id: current_user.id)
    # params.require(:about).permit(:content, :image, :url, :user_id)
    # params.require(:about).permit(:text, :image, :url).merge(user_id: current_user.id)
  end

end
