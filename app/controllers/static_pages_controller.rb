class StaticPagesController < ApplicationController

  skip_before_action :login_required

  def home

    @user = current_user

  end

  def about

  end

  def index

  end

end
