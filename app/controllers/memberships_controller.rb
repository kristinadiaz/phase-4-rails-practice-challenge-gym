class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def create 
        membership = Membership.create!(membership_params)
        render json: membership, status: :created
    end

    private

    def membership_params
        params.permit(:charge, :gym_id, :client_id)
    end

    def render_not_found_response 
        render json: {errors: "Not Found"}, status: :not_found 
    end
end
