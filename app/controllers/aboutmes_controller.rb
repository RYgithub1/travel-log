class AboutmesController < ApplicationController

  def index
    @abouts = Aboutme.includes(:user).all
  end

  def new
    @about = Aboutme.new
  end

  def create
    @about = Aboutme.new(about_params)
      if @about.save
          redirect_to aboutmes_path, notice: "新規About作成成功！"
      else
        redirect_to new_aboutme_path, notice: "再作成してください"
      end
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
    params.require(:aboutme).permit(:content, :image, :url).merge(user_id: current_user.id)
  end

end
