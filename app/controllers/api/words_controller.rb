module Api
  class WordsController < ApplicationController
    before_action :authenticate_api_user!

    def index
      # words = Word.all
      # words = Word.includes(:user).order(createdat: :desc).limit(20)
      words = current_api_user.words.order(creaetd_at: :desc)
      render json: {
        words: words
      }, status: :ok
    end

    def create
      # word = Word.new(word_params)
      word = current_user.words.new(word_params)
      if word.save!
        render json: {
          word: word
        }, status: :created
      else
        render json: {}, status: :internal_server_error
      end
    end

    def show
      # word = Word.find(params[:id])
      word = current_user.words.find(params[:id])
      render json: {
        word: word
      }, status: :ok
    end

    def update
      word = Word.find(params[:id])
      # word = current_user.words.find(params[:id])
      if word.update(word_params)
        render json: {
          word: word
        }, status: :ok
      else
        rendeer json: {}, status: :internal_server_error
      end
    end

    def destroy
      # word = Word.find(params[:id])
      word = current_user.posts.find(params[:id])
      if word.destroy
        render json: {}, status: :ok
      else
        render json: {}, status: :internal_server_error
      end
    end

    private

      def word_params
        params.require(:word).permit(:word, :memo, :archive)
      end

  end
end
