class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = Category.find(params[:category_id])
  end

  def new
    @category = Category.find(params[:category_id])
    @transaction = Record.new
  end

  def create

    @record = current_user.records.new(record_params)

    if @record.save
      @record_category = RecordCategory.create(category_id: params[:category_id], record_id: @record.id)
      redirect_to category_transactions_path @record_category.category_id, flash: { success: "#{@record.name} has been successfully created!" }
    else
      redirect_to new_category_transaction_path @record_category.category_id, flash: { error: @record.errors.full_messages }
    end
  end

  private

  def record_params
    params.require(:record).permit(:name, :amount)
  end
end
