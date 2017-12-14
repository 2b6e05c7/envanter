class PanelController < ApplicationController

  def index
  end

  def users
    @users = User.paginate(:page => params[:page], :per_page => 10)
  end

  def user
    return redirect_to users_path unless User.exists?(params[:id])
    @user = User.find(params[:id])
    @debits = Debit.where(user: @user)
  end

  def debits
    @debits = Debit.paginate(:page => params[:page], :per_page => 10)
  end

  def logs
    @activities = PublicActivity::Activity.paginate(:page => params[:page], :per_page => 10)
  end

end
