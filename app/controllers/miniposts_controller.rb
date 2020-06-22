class MinipostsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :correct_user, only: %i[destroy]

  def create
    @minipost = current_user.miniposts.build(minipost_params)
    if @minipost.save
      flash[:success] = 'Minipost created!'
      redirect_to home_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @minipost.destroy
    flash[:success] = 'Minipost deleted'
    redirect_to request.referrer || home_path
  end

  private

  def minipost_params
    params.require(:minipost).permit(:content, :picture)
  end

  def correct_user
    @minipost = current_user.miniposts.find_by(id: params[:id])
    redirect_to home_path if @minipost.nil?
  end
end
