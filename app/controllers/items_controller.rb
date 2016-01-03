class ItemsController < ApplicationController
	def index
		@items = Item.all
	end

	def show
		@item = Item.find(params[:id])
	end

	def new
		@item = Item.new
	end

	def edit

	end

	def create
		@item = Item.new(create_params)
		
		if @item.save
			redirect_to item_path(@item)
		else
			render 'new'
		end
	end

	def update

	end

	def destroy
    	@item = Item.find(params[:id])
    	@item.destroy
    	redirect_to items_path
	end

	def create_params
		params.require(:item).permit(:title, :price, :photo, :description, :link)
	end
end
