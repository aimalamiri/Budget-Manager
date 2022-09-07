class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = Category.find(params[:category_id])
  end

  def new
    @categories = Category.all
    @transaction = Record.new
  end

  def create
    categories = params['record']['category_id']
    name = params['record']['name']
    amount = params['record']['amount']
    @record = current_user.records.new(name:, amount:)

    if @record.save
      categories.each do |category|
        RecordCategory.create(category_id: category.to_i, record_id: @record.id) if category != ''
      end
      redirect_to category_transactions_path categories[categories.size - 1].to_i,
                                             flash: { success: "#{@record.name} has been successfully created!" }
    else
      redirect_to new_transaction_path, flash: { error: @record.errors.full_messages }
    end
  end
end
