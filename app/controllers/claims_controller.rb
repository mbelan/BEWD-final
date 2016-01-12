class ClaimsController < ApplicationController

	def destroy
    	@claim = Claim.find[:id]
    	@claim.destroy
    	redirect_to items_path
	end
end
