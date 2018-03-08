class PanelController < ApplicationController
  before_action :verify_policy
  before_action :set_user, only: %i[user change_user_role edit_user_groups]

  def index
    set_logs_count
    set_groups
  end

  def users
    @users = User.page(params[:page])
  end

  def user
    @debits = Debit.where(user: @user)
    @user_groups = @user.groups
    @joinable_groups = Group.all - @user_groups
  end

  def change_user_role
    @user.role = params[:role]
    @user.save
    redirect_to_referer_page
  end

  def edit_user_groups
    @group = Group.find(params[:group_id])
    if @user.groups.include?(@group)
      @user.groups.delete(@group)
    else
      @user.groups << @group
    end
    redirect_to_referer_page
  end

  def logs
    @logs = PublicActivity::Activity.page(params[:page])
  end

  private

  def set_user
    return redirect_to users_path unless User.exists?(params[:id])
    @user = User.find(params[:id])
  end

  def set_logs_count
    @logs_count = Array.new(14) do |i|
      PublicActivity::Activity.all.where(created_at: (i + 1).day.ago..i.day.ago).size
    end
  end

  def set_groups
    @total_group_debits = Debit.where.not(group_id: nil).size
    @groups = Group.all.map { |g| { name: g.name, debits: g.debits.size } }.to_json
  end

  def redirect_to_referer_page
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  def verify_policy
    authorize self
  end
end
