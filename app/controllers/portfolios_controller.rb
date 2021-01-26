class PortfoliosController < ApplicationController
	def index
		@portfolio_items = Portfolio.all

	end

def new
	@portfolio_items = Portfolio.new
end

def show
	@portfolio_item = Portfolio.find(params[:id])
end

def create
    @portfolio_items = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_items.save
        format.html { redirect_to portfolios_path notice: 'Portfolio item now Live' }
      else
        format.html { render :new }
      end
    end
  end

def edit
	@portfolio_item = Portfolio.find(params[:id])
end

def update
    respond_to do |format|
      if Portfolio.find(params[:id]).update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'Portfolio item Updated' }
      else
        format.html { render :edit }
      end
    end
  end
def destroy
end
end
