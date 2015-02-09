class Api::V1::UsersController < Api::V1::BaseController

  private


    def user_params
      params.require(:user).permit(:name, :age, :city, :state, :points)
    end

    def query_params
      params.permit(:name, :age, :city, :state, :points)
    end

end

