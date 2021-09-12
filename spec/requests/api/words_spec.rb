require 'rails_helper'

RSpec.describe "Words", type: :request do

  let(:user) { FactoryBot.create(:user) }
  let(:word) { user.words.create( word: Faker::Lorem.word, memo: Faker::Lorem.sentence ) }

  describe "GET /api/words" do
    context 'ログインしているとき' do
      it 'ホーム画面が表示されること' do
        @res = sign_in(user)         #ログイン
        get api_words_path, headers: @res
        expect(response).to have_http_status(200)
      end
    end

    context 'ログインしていないとき' do
      it 'ホーム画面が表示されない（認証エラーになる）こと' do
        get api_words_path
        expect(response).to have_http_status(401)
      end
    end
  end

  describe "GET /api/words/archive" do
    context 'ログインしているとき' do
      it 'アーカイブが表示されること' do
        @res = sign_in(user)         #ログイン
        get api_words_archive_path, headers: @res
        expect(response).to have_http_status(200)
      end
    end

    context 'ログインしていないとき' do
      it 'アーカイブが表示されない（認証エラーになる）こと' do
        get api_words_archive_path
        expect(response).to have_http_status(401)
      end
    end
  end


  describe "POST /api/words" do
    context 'ログインしているとき' do
      before do
      end
      it "単語が新規作成できること" do
        @res = sign_in(user)        #ログイン
        post api_words_path, params: { word: { word: "タイトル", memo: "メモ" } }, headers: @res
        expect(response.status).to eq(201)
      end
    end

    context 'ログインしていないとき' do
      it '新規作成できない（認証エラーになる）こと' do
        post api_words_path, params: { word: { word: "タイトル", memo: "メモ" } }
        expect(response.status).to eq(401)
      end
    end
  end

  describe "PATCH /api/words/:id" do
    context 'ログインしているとき' do
      it '単語を更新することができること' do
        @res = sign_in(user)        #ログイン
        patch api_word_path(word), params: { word: { word: "タイトル", memo: "メモ" } }, headers: @res
        expect(response.status).to eq(200)
      end
    end

    context 'ログインしていないとき' do
      it '更新できない（認証エラーになる）こと' do
        patch api_word_path(word), params: { word: { word: "タイトル", memo: "メモ" } }
        expect(response.status).to eq(401)
      end
    end
  end

  describe "DELETE PATCH /api/words/:id" do
    context 'ログインしているとき' do
      it '単語を削除できること' do
        @res = sign_in(user)        #ログイン
        delete api_word_path(word), headers: @res
        expect(response.status).to eq(200)
      end
    end

    context 'ログインしていないとき' do
      it '削除できない（認証エラーになる）こと' do
        patch api_word_path(word)
        expect(response.status).to eq(401)
      end
    end
  end

end
