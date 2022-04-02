class ExpensesController < ApplicationController
  load_and_authorize_resource
  def index
    @group = Group.find(params[:group_id])
    @expenses = @group.expenses.all.order(created_at: :desc)
  end

  def new
    @group = Group.find(params[:group_id])
    @expense = @group.expenses.new
  end

  def create
    @group = Group.find(params[:group_id])
    @expense = @group.expenses.create(name: expense_params[:name], amount: expense_params[:amount],
                                      user_id: current_user.id, group_id: @group.id)
    respond_to do |format|
      if @expense.save
        format.html { redirect_to group_expenses_path(@group.id), notice: 'Transaction has been successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
