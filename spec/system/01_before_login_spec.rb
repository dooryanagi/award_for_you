# frozen_string_literal: true

require 'rails_helper'

describe '[STEP1] ユーザログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい', spec_category: "ルーティング・URL設定の理解(ログイン状況に合わせた応用)" do
        expect(current_path).to eq '/'
      end
      it '「はじめての方」ボタン: 「はじめての方」ボタンが表示される', spec_category: "ルーティング・URL設定(ログイン状況に合わせる)" do
        expect(page).to have_content "はじめての方"
      end
      it '「はじめての方」ボタン：リンクの内容が正しい', spec_category: "ルーティング・URL設定(ログイン状況に合わせる)" do
        first_time_link = find_all('a')[6].text
        expect(page).to have_link first_time_link, href: about_path
      end

      # アワードについて
      it '新しいアワード:アワード詳細へのリンク（/awards/を含む）を持つ画像が４つ表示される', spec_category: "ルーティング・URL設定(ログイン状況に合わせる)" do
        expect(page).to have_selector('a[href*="/awards/"] img', count: 4)
      end
      it '「アワードを受賞する」ボタン: 「アワードを受賞する」ボタンが表示される', spec_category: "ルーティング・URL設定(ログイン状況に合わせる)" do
        expect(page).to have_selector('a[href="/awards/new"]', text: 'アワードを受賞する')
      end

      # 大賞について
      it '新しい大賞:大賞詳細へのリンク（/grand_prizes/を含む）を持つ画像が４つ表示される', spec_category: "ルーティング・URL設定(ログイン状況に合わせる)" do
        expect(page).to have_selector('a[href*="/grand_prizes/"] img', count: 4)
      end
      it '「大賞一覧から受賞する大賞を選ぶ」ボタン: 「大賞一覧から受賞する大賞を選ぶ」ボタンが表示される', spec_category: "ルーティング・URL設定(ログイン状況に合わせる)" do
        expect(page).to have_selector('a[href="/grand_prizes"]', text: '大賞一覧から受賞する大賞を選ぶ')
      end
    end
  end

  describe 'アバウト画面のテスト' do
    before do
      visit about_path
    end

    context '表示内容の確認' do
      it 'URLが正しい', spec_category: "ルーティング・URL設定(ログイン状況に合わせる)" do
        expect(current_path).to eq '/about'
      end
      it 'マイページへのリンクが存在しない', spec_category: "ルーティング・URL設定(ログイン状況に合わせる)" do
        expect(page).to_not eq '/my_page'
      end
      it '「登録して利用開始！」ボタン: 「登録して利用開始！」ボタンが表示される', spec_category: "ルーティング・URL設定(ログイン状況に合わせる)" do
        expect(page).to have_content "登録して利用開始！"
      end
      it '「登録して利用開始！」ボタン：リンクの内容が正しい', spec_category: "ルーティング・URL設定(ログイン状況に合わせる)" do
        registration_link = find_all('a')[11].text
        expect(page).to have_link registration_link, href: new_user_registration_path
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしていない場合' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'AWARD FOR YOUリンクが表示される: 左上から1番目のリンクが「AWARD FOR YOU」である', spec_category: "CRUD機能に対するコントローラの処理と流れ(ログイン状況を反映)" do
        logo_link = find('a.navbar-brand')
        expect(logo_link[:href]).to eq root_path
      end

      it 'Aboutリンクが表示される: 左上から2番目のリンクが「About」である', spec_category: "CRUD機能に対するコントローラの処理と流れ(ログイン状況を反映)" do
        about_link = find_all('a')[1].text
        expect(about_link).to match(/ABOUT/)
      end
      it 'アワード一覧リンクが表示される: 左上から3番目のリンクが「アワード一覧」である', spec_category: "CRUD機能に対するコントローラの処理と流れ(ログイン状況を反映)" do
        award_index_link = find_all('a')[2].text
        expect(award_index_link).to match(/アワード一覧/)
      end
      it '大賞一覧リンクが表示される: 左上から4番目のリンクが「大賞一覧」である', spec_category: "CRUD機能に対するコントローラの処理と流れ(ログイン状況を反映)" do
        grand_prize_index_link = find_all('a')[3].text
        expect(grand_prize_index_link).to match(/大賞一覧/)
      end
      it 'ログインリンクが表示される: 左上から5番目のリンクが「ログイン」である', spec_category: "CRUD機能に対するコントローラの処理と流れ(ログイン状況を反映)" do
        login_link = find_all('a')[4].text
        expect(login_link).to match(/ログイン/)
      end
      it '新規登録リンクが表示される: 左上から6番目のリンクが「新規登録」である', spec_category: "CRUD機能に対するコントローラの処理と流れ(ログイン状況を反映)" do
        signup_link = find_all('a')[5].text
        expect(signup_link).to match(/新規登録/)
      end
    end

  #   context 'リンクの内容を確認' do
  #     subject { current_path }

  #     it 'Bookersを押すと、トップ画面に遷移する', spec_category: "ルーティング・URL設定の理解(ログイン状況に合わせた応用)" do
  #       home_link = find_all('a')[0].text
  #       home_link = home_link.delete(' ')
  #       home_link.gsub!(/\n/, '')
  #       click_link home_link
  #       is_expected.to eq '/'
  #     end
  #     it 'Homeを押すと、トップ画面に遷移する', spec_category: "ルーティング・URL設定の理解(ログイン状況に合わせた応用)" do
  #       home_link = find_all('a')[1].text
  #       home_link = home_link.delete(' ')
  #       home_link.gsub!(/\n/, '')
  #       click_link home_link
  #       is_expected.to eq '/'
  #     end
  #     it 'Aboutを押すと、アバウト画面に遷移する', spec_category: "ルーティング・URL設定の理解(ログイン状況に合わせた応用)" do
  #       about_link = find_all('a')[2].text
  #       about_link = about_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
  #       click_link about_link
  #       is_expected.to eq '/home/about'
  #     end
  #     it 'Sign upを押すと、新規登録画面に遷移する', spec_category: "ルーティング・URL設定の理解(ログイン状況に合わせた応用)" do
  #       signup_link = find_all('a')[3].text
  #       signup_link = signup_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
  #       click_link signup_link, match: :first
  #       is_expected.to eq '/users/sign_up'
  #     end
  #     it 'Log inを押すと、ログイン画面に遷移する', spec_category: "ルーティング・URL設定の理解(ログイン状況に合わせた応用)" do
  #       login_link = find_all('a')[4].text
  #       login_link = login_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
  #       click_link login_link, match: :first
  #       is_expected.to eq '/users/sign_in'
  #     end
  #   end
  end

  # describe 'ユーザ新規登録のテスト' do
  #   before do
  #     visit new_user_registration_path
  #   end

  #   context '表示内容の確認' do
  #     it 'URLが正しい', spec_category: "deviseの基本的な導入・認証設定" do
  #       expect(current_path).to eq '/users/sign_up'
  #     end
  #     it '「Sign up」と表示される', spec_category: "deviseの基本的な導入・認証設定" do
  #       expect(page).to have_content 'Sign up'
  #     end
  #     it 'nameフォームが表示される', spec_category: "deviseの基本的な導入・認証設定" do
  #       expect(page).to have_field 'user[name]'
  #     end
  #     it 'emailフォームが表示される', spec_category: "deviseの基本的な導入・認証設定" do
  #       expect(page).to have_field 'user[email]'
  #     end
  #     it 'passwordフォームが表示される', spec_category: "deviseの基本的な導入・認証設定" do
  #       expect(page).to have_field 'user[password]'
  #     end
  #     it 'password_confirmationフォームが表示される', spec_category: "deviseの基本的な導入・認証設定" do
  #       expect(page).to have_field 'user[password_confirmation]'
  #     end
  #     it 'Sign upボタンが表示される', spec_category: "deviseの基本的な導入・認証設定" do
  #       expect(page).to have_button 'Sign up'
  #     end
  #   end

  #   context '新規登録成功のテスト' do
  #     before do
  #       fill_in 'user[name]', with: Faker::Lorem.characters(number: 10)
  #       fill_in 'user[email]', with: Faker::Internet.email
  #       fill_in 'user[password]', with: 'password'
  #       fill_in 'user[password_confirmation]', with: 'password'
  #     end

  #     it '正しく新規登録される', spec_category: "CRUD機能に対するコントローラの処理と流れ(ログイン状況を意識した応用)" do
  #       expect { click_button 'Sign up' }.to change(User.all, :count).by(1)
  #     end
  #     it '新規登録後のリダイレクト先が、新規登録できたユーザの詳細画面になっている', spec_category: "CRUD機能に対するコントローラの処理と流れ(ログイン状況を意識した応用)" do
  #       click_button 'Sign up'
  #       expect(current_path).to eq '/users/' + User.last.id.to_s
  #     end
  #   end
  # end

  # describe 'ユーザログイン' do
  #   let(:user) { create(:user) }

  #   before do
  #     visit new_user_session_path
  #   end

  #   context '表示内容の確認' do
  #     it 'URLが正しい', spec_category: "deviseの基本的な導入・認証設定" do
  #       expect(current_path).to eq '/users/sign_in'
  #     end
  #     it '「Log in」と表示される', spec_category: "deviseの基本的な導入・認証設定" do
  #       expect(page).to have_content 'Log in'
  #     end
  #     it 'nameフォームが表示される', spec_category: "deviseの基本的な導入・認証設定" do
  #       expect(page).to have_field 'user[name]'
  #     end
  #     it 'passwordフォームが表示される', spec_category: "deviseの基本的な導入・認証設定" do
  #       expect(page).to have_field 'user[password]'
  #     end
  #     it 'Log inボタンが表示される', spec_category: "deviseの基本的な導入・認証設定" do
  #       expect(page).to have_button 'Log in'
  #     end
  #     it 'emailフォームは表示されない', spec_category: "deviseの基本的な導入・認証設定" do
  #       expect(page).not_to have_field 'user[email]'
  #     end
  #   end

  #   context 'ログイン成功のテスト' do
  #     before do
  #       fill_in 'user[name]', with: user.name
  #       fill_in 'user[password]', with: user.password
  #       click_button 'Log in'
  #     end

  #     it 'ログイン後のリダイレクト先が、ログインしたユーザの詳細画面になっている', spec_category: "CRUD機能に対するコントローラの処理と流れ(ログイン状況を意識した応用)" do
  #       expect(current_path).to eq '/users/' + user.id.to_s
  #     end
  #   end

  #   context 'ログイン失敗のテスト' do
  #     before do
  #       fill_in 'user[name]', with: ''
  #       fill_in 'user[password]', with: ''
  #       click_button 'Log in'
  #     end

  #     it 'ログインに失敗し、ログイン画面にリダイレクトされる', spec_category: "CRUD機能に対するコントローラの処理と流れ(ログイン状況を意識した応用)" do
  #       expect(current_path).to eq '/users/sign_in'
  #     end
  #   end
  # end

  # describe 'ヘッダーのテスト: ログインしている場合' do
  #   let(:user) { create(:user) }

  #   before do
  #     visit new_user_session_path
  #     fill_in 'user[name]', with: user.name
  #     fill_in 'user[password]', with: user.password
  #     click_button 'Log in'
  #   end

  #   context 'ヘッダーの表示を確認' do
  #     it 'Bookersリンクが表示される: 左上から1番目のリンクが「Bookers」である', spec_category: "ログイン状況に合わせた画面表示や機能制限のロジック設定" do
  #       home_link = find_all('a')[0].text
  #       expect(home_link).to match(/Bookers/)
  #     end
  #     it 'Homeリンクが表示される: 左上から2番目のリンクが「Home」である', spec_category: "ログイン状況に合わせた画面表示や機能制限のロジック設定" do
  #       home_link = find_all('a')[1].text
  #       expect(home_link).to match(/Home/)
  #     end
  #     it 'Usersリンクが表示される: 左上から3番目のリンクが「Users」である', spec_category: "ログイン状況に合わせた画面表示や機能制限のロジック設定" do
  #       users_link = find_all('a')[2].text
  #       expect(users_link).to match(/Users/)
  #     end
  #     it 'Booksリンクが表示される: 左上から4番目のリンクが「Books」である', spec_category: "ログイン状況に合わせた画面表示や機能制限のロジック設定" do
  #       books_link = find_all('a')[3].text
  #       expect(books_link).to match(/Books/)
  #     end
  #     it 'Log outリンクが表示される: 左上から5番目のリンクが「Log out」である', spec_category: "ログイン状況に合わせた画面表示や機能制限のロジック設定" do
  #       logout_link = find_all('a')[4].text
  #       expect(logout_link).to match(/Log out/)
  #     end
  #   end
  # end

  # describe 'ユーザログアウトのテスト' do
  #   let(:user) { create(:user) }

  #   before do
  #     visit new_user_session_path
  #     fill_in 'user[name]', with: user.name
  #     fill_in 'user[password]', with: user.password
  #     click_button 'Log in'
  #     logout_link = find_all('a')[4].text
  #     logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
  #     click_link logout_link
  #   end

  #   context 'ログアウト機能のテスト' do
  #     it '正しくログアウトできている: ログアウト後のリダイレクト先においてAbout画面へのリンクが存在する', spec_category: "CRUD機能に対するコントローラの処理と流れ(ログイン状況を意識した応用)" do
  #       expect(page).to have_link '', href: '/home/about'
  #     end
  #     it 'ログアウト後のリダイレクト先が、トップになっている', spec_category: "CRUD機能に対するコントローラの処理と流れ(ログイン状況を意識した応用)" do
  #       expect(current_path).to eq '/'
  #     end
  #   end
  # end
end
