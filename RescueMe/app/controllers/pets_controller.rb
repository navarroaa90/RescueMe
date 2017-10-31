class PetsController < ApplicationController
    def index
        @pets = Pet.all
    end

    def show
        @pet = Pet.find(params[:id])
    end
    
    def new
        @pet = Pet.new
    end

    def edit

    end

    def create
        @pet = Pet.new(pet_params)
        @pet.user = current_user
        if @pet.save
            redirect_to pets_path(@pet)
        else
            render :new
        end
    end

        def destroy
            @pet = Pet.find(pet_params[:id])
            @pet.user = current_user
             @pet.destroy
            redirect_to pets_path
        end

        private
        
            #strong params
            def pet_params
                params.require(:pet).permit(:pet_name, :gender, :age, :weight, :image, :personality, :info)
            end
    end