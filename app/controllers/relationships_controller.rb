class RelationshipsController < ApplicationController

	def create
		@followed_users = current_user.followed_id
		@relationship = Relationship.find_or_initialize_by followed_id: params[:followed_id], follower_id: current_user.id
		if @relationship.save

			redirect_to items_path
		else
			render 'registrations/search_results'
		end
	end

	def destroy
	end
end
