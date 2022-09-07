class TransactionsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
  end

  def new
    @category = Category.find(1)
    @transaction = Record.new
  end
end
