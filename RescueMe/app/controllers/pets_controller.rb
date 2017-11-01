class PetsController < ApplicationController
    before_action :authorize
   
    
    def index
        @pets = Pet.all
    end

    def show
        @pet = Pet.find(params[:id])
        @comment = Comment.new
    end
    
    def new
        @pet = Pet.new
    end

    def edit
        @pet = Pet.find(params[:id])
      

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
    
    def update 
        @pet = Pet.find(params[:id])
        if @pet.update_attributes(pet_params)
          redirect_to pet_path
        else
          render 'edit'
        end
    end

        def destroy
            @pet = Pet.find(params[:id])
            @pet.destroy
            redirect_to pets_path
        end
    

        private
        
            #strong params
            def pet_params
                params.require(:pet).permit(:pet_name, :gender, :age, :weight, :image, :personality, :info, :breed)
            end
    end