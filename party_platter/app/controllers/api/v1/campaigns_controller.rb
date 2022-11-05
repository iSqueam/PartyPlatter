class Api::V1::CampaignsController < ApplicationController

    def index
        campaign = Campaign.all

        if campaign
            render json: {stauts: "SUCCESS", message: "All campaigns loaded!", data: campaign}, status: :ok
        else
            render json: {message: "No campaigns loaded"}, status: :bad_request
        end
    end

    # Create a new campaign POST request
    def create
        campaign = Campaign.new(campaign_params)
        puts("="*10)
        puts(campaign_params)
        if campaign.save
            render json: {status: "Success!", message: "New Campaign created!", data: campaign}, status: :ok
        else
            render json: {status: "Failure!", message: "Error creating new campaign"}
        end
    end

    # Show a specific Camapign GET request
    def show
        campaign = Campaign.find(params[:id])

        if campaign
            render json: {status: "Success!", message: "Campaign found!", data: campaign}, status: :ok
        else
            render json: {status: "Failure!", message: "Error finding campaign"}
        end
    end

    # Delete a specific campaign DELETE request
    def destroy
        campaign = Campaign.find(params[:id])

        if campaign.destroy!
            render json: {status: "Success!", message: "Campaign deleted!"}, status: :ok
        else
            render json: {status: "Failure!", message: "Campaign not found or does not exist"}, status: :bad_request
        end
    end

    # Update a campaign PATCH request
    def update
        campaign = Campaign.find(params[:id])

        if campaign.update!(campaign_params)
            render json: {status: "Success!", message: "Campaign updated!", data: campaign}, status: :ok
        else
            render json: {status: "Failure!", message: "Campaign could not be updated"}, status: :unprocessable_entity
        end
    end

    private

    def campaign_params
        params.require(:campaign).permit(
            :name,
            :minplayers,
            :maxplayers
        )
    end
end