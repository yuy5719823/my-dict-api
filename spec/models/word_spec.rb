require 'rails_helper'

RSpec.describe Word, type: :model do

  describe '単語の新規作成' do

    let(:word) { FactoryBot.build(:word) }

    context '単語を正常に登録' do
      it '単語のタイトルとメモを記述' do
        expect(word).to be_valid
        word.save

        registered_word = Word.find(1)

        expect(registered_word.word).to eq('タイトル')
        expect(registered_word.memo).to eq('メモ')

        expect(Word.all.count).to eq 1
      end

      it '単語のタイトルのみ記述' do
        word.memo = ''
        expect(word).to be_valid
      end
    end

    context '単語の登録に失敗' do
      it '単語のタイトル未入力' do
        word.word = ''
        expect(word).not_to be_valid
      end
    end
    
  end
end
