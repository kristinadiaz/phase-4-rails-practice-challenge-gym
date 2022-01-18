class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def show
        render json: find_client
    end

    def update
        client = find_client
        render json: client.update(client_params), status: :accepted
    end

    private

    def find_client
        Client.find(params[:id])
    end

    def client_params
        params.permit(:id, :name, :age)
    end

    def render_not_found_response 
        render json: {errors: "Not Found"}, status: :not_found 
    end
end
