class PortfoliosController < ApplicationController
def index
	@portfolio_item = Portfolio.all
   ### Scope Examples:
   #Portfolio.ruby_on_rails_portfolio_items
   #@portfolio_item = Portfolio.angular
end

def angular
  @angular_portfolio_items = Portfolio.angular
end

def new
	@portfolio_item = Portfolio.new
  3.times {@portfolio_item.technologies.build}
end

def show
	@portfolio_item = Portfolio.find(params[:id])
end

def create
  @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name]))

  respond_to do |format|
    if @portfolio_item.save
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
	#Perform the lookup
	@portfolio_item = Portfolio.find(params[:id])
	
	#Destroy/delete the record
	@bortfolio_item .destroy
	
	#Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was successfully destroyed.' }
    end
end
end
