class PanelController < ApplicationController
  before_action :verify_policy

  def index
    set_logs_count
    set_groups
  end

  def users
    @users = User.page(params[:page])
  end

  def user
    return redirect_to users_path unless User.exists?(params[:id])
    @user = User.find(params[:id])
    @debits = Debit.where(user: @user)
  end

  def change_user_role
    @user = User.find(params[:id])
    @user.role = params[:role]
    @user.save
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  def logs
    @logs = PublicActivity::Activity.page(params[:page])
  end

  private

  def set_logs_count
    @logs_count = Array.new(14) do |i|
      PublicActivity::Activity.all.where(created_at: (i + 1).day.ago..i.day.ago).size
    end
  end

  def set_groups
    @groups = Group.all.map { |g| { name: g.name, debits: g.debits.size } }.to_json
  end

  def verify_policy
    authorize self
  end
end
