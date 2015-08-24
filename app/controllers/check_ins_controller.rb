class CheckInsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create]

  def new
  	@check_in = current_user.check_ins.build if logged_in?
  end
  
  def create
    @check_in = current_user.check_ins.build(check_in_params)
    if @check_in.save
      flash[:success] = "Check-In Successful!"
      redirect_to root_url
		else
      render 'static_pages/home'
    end
	end

	private
    def check_in_params
      params.require(:check_in).permit(:campus)
end
end
