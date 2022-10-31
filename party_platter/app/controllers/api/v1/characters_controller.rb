class Api::V1::CharactersController < ApplicationController

    def index
        characters = Character.all 
      
        if characters
          render json: {status: "SUCCESS", message: "Fetched all the characters successfully", data: characters}, status: :ok
        else
          render json: {message: "No characters found"}, status: :bad_request
        end
      end

    # Create a new Character POST request
    def create
        character = Character.new(character_params)

        if character.save
            render json: {status: "SUCCESS", message: "Character was created successfully", data: character},
            status: :created
        else
            render json: {status: "FAILURE", message: "Error creating character!"}
        end
    end

    # Show a specific character GET request
    def show
        character = Character.find(params[:id])
        if character
            render json: {data: character}, state: :ok
        else
            render json: {message: "Character could not be found"}, status: :bad_request
        end
    end
    
    # Delete a specific character DELETE request
    def destroy
        character = Character.find(params[:id])
    
        if character.destroy!
            render json: {message: "Character was deleted successfully"}, status: :ok
        else
            render json: {message: "Character does not exist"}, status: :bad_request
        end
    end
    
    # Update details for a specific character. PATCH request
    def update
        character = Character.find(params[:id])
    
        if character.update!(character_params)
            render json: {message: "Character was updated successfully", data: character}, status: :ok
        else
            render json: {message: "Character cannot be updated"}, status: :unprocessable_entity
        end
    end  

    private

    def character_params
        params.require(:character).permit(
            :user,
            :name,
            :strength,
            :dexterity,
            :constitution,
            :intelligence,
            :wisdom,
            :charisma
            )
    end

end