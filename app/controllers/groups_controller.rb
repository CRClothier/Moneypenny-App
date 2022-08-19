class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @groups = @user.groups
    redirect_to user_groups_path(current_user) unless User.find_by(id: params[:user_id]) == current_user
  end

  def new
    @group = Group.new
  end

  def create
    @user = current_user
    @group = @user.groups.new(group_params)
    @group.author_id = @user.id
    if @group.save
      flash[:notice] = 'Group successfully created!'
      redirect_to user_groups_path(current_user)
    else
      flash[:notice] = 'Group not created!'
      render :new
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:notice] = 'Group successfully deleted!'
    redirect_to user_groups_path(current_user)
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = 'Group successfully updated!'
      redirect_to user_groups_path(current_user)
    else
      flash[:notice] = 'Group not updated!'
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
