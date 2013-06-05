class UsersController < ApplicationController
  def show
    # @user = ...
    render :json => @user
  end
end
