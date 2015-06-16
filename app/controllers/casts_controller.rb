class CastsController < ApplicationController
  def index
    @casts = Cast.all
    respond_to do |format|
        format.json do
            render json: @casts.to_json
        end
    end
  end
end
