require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'ユーザー登録' do

    let(:user) { FactoryBot.build(:user) }

    context '登録する(正常)' do
      it '正常に登録できること' do
        expect(user).to be_valid
        user.save

        registered_user = User.find(1)

        expect(registered_user.name).to eq('user')
        expect(registered_user.email).to eq('sample1@example.com')

        expect(User.all.count).to eq 1
      end
      
      context '登録する(失敗)' do
        it 'ユーザーネームの未入力' do
          user.name = ''

          expect(user.save).to be_falsey
        end

        it 'メールアドレス未入力' do
          user.email = ''

          expect(user.save).to be_falsey
        end

        it 'パスワードの未入力' do
          user.password = ''

          expect(user.save).to be_falsey
        end

        it 'パスワードの不一致'do
          user.password = 'hogehoge'

          expect(user.save).to be_falsey
        end
      end
      
    end
  end

end
