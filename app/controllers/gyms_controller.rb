class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index 
        render json: Gym.all 
    end

    def show
        render json: find_gym
    end

    def create 
        gym = Gym.create!(gym_params)
        render json: gym, status: :created
    end

    def update
        gym = find_gym
        render json: gym.update(gym_params), status: :accepted
    end

    def destroy
        gym = find_gym
        gym.destroy
        render json: { error: "Gym not found" }, status: :not_found
    end

    private

    def find_gym
        Gym.find(params[:id])
    end

    def gym_params
        params.permit(:id, :name, :address)
    end

    def render_not_found_response 
        render json: {errors: "Not Found"}, status: :not_found 
    end
end
