class ItemsController < ApplicationController

	def index
		@items = current_user.items
		if params[:search]
			@users = User.search(params[:search])
		end
	end

	def show
		@item = Item.find(params[:id])
	end

	def new
		@item = Item.new
	end

	def edit
		@item = Item.find(params[:id])
	end

	def create
		@item = current_user.items.build create_params
		
		if @item.save
			redirect_to item_path(@item)
		else
			render 'new'
		end
	end

	def update
		@item = Item.find(params[:id])
		if @item.user == current_user
			@item.update(create_params)
		else
			@item.update(claim_params)
		end

		if @item.save
    		redirect_to item_path(@item)
    	else
    		flash.now[:error] = @item.errors.messages.first.join(" ")
    		render 'edit'
    	end
	end

	def destroy
    	@item = Item.find(params[:id])
    	@item.destroy
    	redirect_to items_path
	end

	private

	def create_params
		params.require(:item).permit(:title, :price, :photo, :description, :link, :claimed_by, :claimed => 'false')
	end

	def claim_params
		params.require(:item).permit(:claimed, :claimer_id)
	end
end
