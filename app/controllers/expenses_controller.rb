class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @group = @user.groups.find(params[:group_id])
    @expenses = @user.expenses.where(group_id: @group.id)
    @total_transactions = total_transactions
    redirect_to user_group_expenses_path(current_user) unless User.find_by(id: params[:user_id]) == current_user
  end

  def new
    @user = current_user
    @expense = Expense.new
    @group = @user.groups.find(params[:group_id])
  end

  def create
    @user = current_user
    @group = @user.groups.find_by(id: expense_params[:group_id])
    @expense = @user.expenses.create(name: expense_params[:name], amount: expense_params[:amount], author_id: @user.id,
                                     group_id: expense_params[:group_id])
    @group_expense = @expense.group_expenses.new(group_id: @group.id, expense_id: @expense.id)
    if @expense.save && @group_expense.save
      flash[:notice] = 'Transaction successfully created!'
      redirect_to user_group_expenses_path(current_user, @group)
    else
      flash[:notice] = 'Transaction not created!'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user = current_user
    @group = @user.groups.find(params[:group_id])
    @expense = @user.expenses.find(params[:id])
    @expense.destroy
    flash[:notice] = 'Transaction successfully deleted!'
    redirect_to user_group_expenses_path(current_user, @group)
  end

  def edit
    @user = current_user
    @group = @user.groups.find(params[:group_id])
    @expense = @user.expenses.find(params[:id])
  end

  def update
    @user = current_user
    @group = @user.groups.find(params[:group_id])
    @expense = @user.expenses.find(params[:id])
    if @expense.update(expense_params)
      flash[:notice] = 'Transaction successfully updated!'
      redirect_to user_group_expenses_path(current_user, @group)
    else
      flash[:notice] = 'Transaction not updated!'
      render :edit, status: :unprocessable_entity
    end
  end

  def total_transactions
    @user = current_user
    @group = @user.groups.find(params[:group_id])
    @expenses = @user.expenses.where(group_id: @group.id)
    @total_transactions = 0
    @expenses.each do |expense|
      @total_transactions += expense.amount
    end
    @total_transactions
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :group_id)
  end
end
