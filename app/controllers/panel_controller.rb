class PanelController < ApplicationController
  # I18n.locale = :tr #FIXME Temporary config

  def index
  end

  def users
    @users = User.all
  end

  def debits
  end

  def logs
  end
end
