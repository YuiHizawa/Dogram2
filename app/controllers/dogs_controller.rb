class DogsController < ApplicationController
    def index
        @dogs = Dog.all
    end
    def show
        @dog = Dog.find(params[:id])
        @post_comment = PostComment.new
    end
    def new
        @dog = Dog.new
    end
    def create
    dog = Dog.new(dog_params)
    dog.user_id = current_user.id
    dog.save
    redirect_to dogs_path
    end
    def edit
        @dog = Dog.find(params[:id])
    end
    def update
        dog = Dog.find(params[:id])
        dog.update(dog_params)
        redirect_to dog_path(dog.id)
    end
    def destroy
        dog = Dog.find(params[:id])
        dog.destroy
        redirect_to dogs_path
    end
    private
    def dog_params
    params.require(:dog).permit(:title, :introduce, :image, :user_id)
    end
end
