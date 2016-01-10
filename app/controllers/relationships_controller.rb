class RelationshipsController < ApplicationController

	def create
		@relationship = Relationship.find_or_initialize_by followed_id: params[:followed_id], follower_id: current_user.id
		if @relationship.save

			redirect_to items_path
		else
			render 'registrations/search_results'
		end
	end

	def destroy
		@relationship = Relationship.find_by(follower_id: current_user, followed_id: params[:id])
		@relationship.destroy
		if @relationship.destroy
			redirect_to items_path
		else
			render 'registrations/show'
		end
	end
end
