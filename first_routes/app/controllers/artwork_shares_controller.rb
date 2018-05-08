class ArtworkSharesController < ApplicationController

  def create
    debugger
    artwork_share = ArtworkShare.new(artwork_share_parms)
    if artwork_share.save
      render json: artwork_share
    else
      render json: artwork_share.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork_share = ArtworkShare.find(params[:id])
    artwork_share.destroy
    render json: artwork_share
  end


   private

   def artwork_share_params
     param.require(:artwork_share).permit(:viewer_id, :artwork_id)
  end
end
