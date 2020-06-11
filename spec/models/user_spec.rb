require "rails_helper"

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー作成:成功' do
    it "正常なパターン" do
    end
  end
  context 'ユーザー作成:失敗' do
    describe 'ユーザー作成' do
      it "nickname:必須" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "password:必須" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "password:6文字以上" do
        @user.password = "aA1"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "password:半角英数混合(半角英語のみ)" do
        @user.password = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end
      it "password:半角英数混合(数字のみ)" do
        @user.password = "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end
      it "password:半角英数混合(全角英数混合)" do
        @user.password = "ＡＡＡＡＡ１１"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end
      it "email:必須" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      # it "email:一意性" do
      #   @second_user = FactoryBot.build(:user)
      #   @user.email = "test@test.co.jp"
      #   @second_user.email = "test@test.co.jp"
      #   binding.pry
      #   @user.valid?
      #   @second_user.valid?
      #   expect(@second_user.errors.full_messages).to include("メールアドレスを入力してください")
      # end
      it "email:@を含む形式" do
        @user.email = "test.co.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "birth_date:必須" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
      it "first_name:必須" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("姓を入力してください")
      end
      it "first_name:全角（漢字・ひらがな・カタカナ）" do
        @user.first_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("姓全角文字を使用してください")
      end
      it "last_name:必須" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名を入力してください")
      end
      it "last_name:全角（漢字・ひらがな・カタカナ）" do
        @user.last_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("名全角文字を使用してください")
      end
      it "first_name_kana:必須" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("姓（カナ）を入力してください")
      end
      it "first_name_kana:全角（カタカナ）" do
        @user.first_name_kana = "てすと"
        @user.valid?
        expect(@user.errors.full_messages).to include("姓（カナ）全角カタカナを使用してください")
      end
      it "first_name_kana:全角（カタカナ）" do
        @user.first_name_kana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("姓（カナ）全角カタカナを使用してください")
      end
      it "last_name_kana:必須" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名（カナ）を入力してください")
      end
      it "last_name_kana:全角（カタカナ）" do
        @user.last_name_kana = "てすと"
        @user.valid?
        expect(@user.errors.full_messages).to include("名（カナ）全角カタカナを使用してください")
      end
      it "last_name_kana:全角（カタカナ）" do
        @user.last_name_kana = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("名（カナ）全角カタカナを使用してください")
      end
    end
  end
end
