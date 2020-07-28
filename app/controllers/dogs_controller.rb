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
    # １. データを新規登録するためのインスタンス作成
    dog = Dog.new(dog_params)
    dog.user_id = current_user.id
    # ２. データをデータベースに保存するためのsaveメソッド実行
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
        dog = Dog.find(params[:id]) #データ(レコード)を1件取得
        dog.destroy #データ（レコード）を削除
        redirect_to dogs_path #Dogs一覧画面へリダイレクト
    end
    private
    # ストロングパラメータ
    def dog_params
    params.require(:dog).permit(:title, :introduce, :image, :user_id)
    end

end
