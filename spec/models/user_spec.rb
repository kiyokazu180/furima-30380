require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "ニックネームが空ではダメ" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "メールアドレスが空ではダメ" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスが一意である" do
      @user.email = "a@a"
      @user.valid?
     # binding.pry
      expect(@user.errors.full_messages).to include()
    end
    it "メールアドレスに＠がないとダメ" do
      @user.email = "aa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "パスワードが空ではダメ" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
    end
    it "パスワードが６文字以上必要" do
      @user.password = "aaaa1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password","Password is too short (minimum is 6 characters)")
    end
    it "パスワードは半角英数字混合でないとダメ" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワード確認と一致する必要がある" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "漢字の名字がないとダメ" do
      @user.name_lc = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name lc can't be blank","Name lc is invalid")
    end
    it "漢字の名前が空白だとダメ" do
      @user.name_gc = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name gc can't be blank","Name gc is invalid")
    end   
    it "名前（漢字）が全角でないとダメ" do
      @user.name_lc = "ｶﾓ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name lc is invalid")
    end
    it "カタカナの名字がないとダメ" do
      @user.name_l = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name l can't be blank","Name l is invalid")
    end
    it "カタカナの名前がないとダメ" do
      @user.name_g = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name g can't be blank","Name g is invalid")
    end
    it "名前（カタカナ）が全角でないとダメ" do
      @user.name_l = "ｶﾅ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Name l is invalid")
    end
    it "生年月日がないとダメ" do
      @user.birth = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
  end
end
