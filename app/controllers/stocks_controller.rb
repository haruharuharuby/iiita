class StocksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_stock, only:[:show, :update, :destroy]

  def index
    @stocks = current_user.stocks
  end

  def show
  end

  def create
    @stock = current_user.stocks.build(stock_param)
    if @stock.save
      redirect_to article_path(@stock.article), notice: "ストックしました。"
    else
      redirect_to article_path(@stock.article), error: "ストックできませんでした"
    end
  end

  def update
  end

  def destroy
    if @stock.destroy
      redirect_to article_path(@stock.article), notice: "ストックを解除しました。"
    else
      redirect_to article_path(@stock.article), error: "ストックを解除できませんでした。"
    end
  end

  private
    def set_stock
      @stock = current_user.stocks.find(params[:id])
    end

    def stock_param
      params.require(:stock).permit(:article_id)
    end
end
