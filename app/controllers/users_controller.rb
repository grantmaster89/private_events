# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy hovercard]
  before_action :authenticate_user!, only: [:edit]
  def index
    @users = User.all
  end

  def hovercard
    render layout: false
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :name, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
