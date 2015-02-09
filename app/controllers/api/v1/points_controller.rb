class Api::V1::PointsController < Api::V1::BaseController

  private

    def dream_params
      params.require(:point).permit(:date, :category, :description, :user_id)
    end

    def query_params
      # this assumes that a point belongs to a user and has an :user_id
      # allowing us to filter by this
      params.permit(:user_id, :date, :category, :description)
    end

end

