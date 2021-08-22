module Api
  class WordsController < ApplicationController
    before_action :authenticate_api_user!

    def index
      # words = Word.all
      # words = Word.includes(:user).order(createdat: :desc).limit(20)
      words = current_api_user.words.order(creaetd_at: :desc).where(archive: false)
      render json: words, status: :ok
    end

    def archive_index
      words = current_api_user.words.order(creaetd_at: :desc).where(archive: true)
      render json: words, status: :ok
    end

    def create
      # word = Word.new(word_params)
      word = current_api_user.words.build(word_params)
      if word.save!
        render json: {}, status: :created
      else
        render json: {}, status: :internal_server_error
      end
    end

    # def show
    #   # word = Word.find(params[:id])
    #   word = current_api_user.words.find(params[:id])
    #   render json: word, status: :ok
    # end

    def update
      # word = Word.find(params[:id])
      word = current_api_user.words.find(params[:id])
      if word.update(word_params)
        render json: {}, status: :ok
      else
        rendeer json: {}, status: :internal_server_error
      end
    end

    def destroy
      # word = Word.find(params[:id])
      word = current_api_user.words.find(params[:id])
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
