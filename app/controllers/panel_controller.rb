class PanelController < ApplicationController

  def index
  end

  def users
    @users = User.all
  end

  def debits
    @debits = Debit.all
  end

  def logs
    @activities = PublicActivity::Activity.all
  end
end
