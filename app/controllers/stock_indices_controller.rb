class StockIndicesController < ApplicationController
  before_action :set_stock_index, only: [:show, :update, :destroy]

  # GET /stock_indices
  # GET /stock_indices.json
  def index
    @stock_indices = StockIndex.all

    render json: @stock_indices
  end

  # GET /stock_indices/1
  # GET /stock_indices/1.json
  def show
    render json: @stock_index
  end

  # POST /stock_indices
  # POST /stock_indices.json
  def create
    @stock_index = StockIndex.new(stock_index_params)

    if @stock_index.save
      render json: @stock_index, status: :created, location: @stock_index
    else
      render json: @stock_index.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stock_indices/1
  # PATCH/PUT /stock_indices/1.json
  def update
    @stock_index = StockIndex.find(params[:id])

    if @stock_index.update(stock_index_params)
      head :no_content
    else
      render json: @stock_index.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stock_indices/1
  # DELETE /stock_indices/1.json
  def destroy
    @stock_index.destroy

    head :no_content
  end

  private

    def set_stock_index
      @stock_index = StockIndex.find(params[:id])
    end

    def stock_index_params
      params.require(:stock_index).permit(:slug, :name, :description)
    end
end
