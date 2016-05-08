class SalesController < ApplicationController
  def show
    @sale = Sale.find(params[:id])
  end

  def new
    @sale = Sale.new
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def create
    @sale = Sale.new(sale_name)

    if @sale.save
        redirect_to @sale
    else
      render 'new'
    end
  end

  def update
    @sale = Sale.find(params[:id])

    if @sale.update(sale_params)
      redirect_to @sale
    else
      render 'edit'
    end
  end

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy

    redirect_to sales_path
  end

  private
    def sale_params
      params.require(:sale).permit(:product_id, :buyer_id, :quantity, :total_amount)
    end
end
