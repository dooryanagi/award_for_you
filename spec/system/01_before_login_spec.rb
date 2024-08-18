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

    context 'リンクの内容を確認' do
      subject { current_path }

      it 'AWARD FOR YOUを押すと、トップ画面に遷移する', spec_category: "ルーティング・URL設定(ログイン状況に合わせる)" do
        find('.navbar-brand[alt="AWARD FOR YOU"]').click
        expect(current_path).to eq '/'
      end
      it 'Aboutを押すと、アバウト画面に遷移する', spec_category: "ルーティング・URL設定(ログイン状況に合わせる)" do
        about_link = find_all('a')[1].text
        click_link about_link
        is_expected.to eq '/about'
      end
      it 'アワード一覧を押すと、アワード一覧画面に遷移する', spec_category: "ルーティング・URL設定(ログイン状況に合わせる)" do
        award_index_link = find_all('a')[2].text
        click_link award_index_link
        is_expected.to eq '/awards'
      end
      it '大賞一覧を押すと、大賞一覧画面に遷移する', spec_category: "ルーティング・URL設定(ログイン状況に合わせる)" do
        grand_prize_index_link = find_all('a')[3].text
        click_link grand_prize_index_link, match: :first
        is_expected.to eq '/grand_prizes'
      end
      it 'ログインを押すと、ログイン画面に遷移する', spec_category: "ルーティング・URL設定(ログイン状況に合わせる)" do
        login_link = find_all('a')[4].text
        click_link login_link
        is_expected.to eq '/users/sign_in'
      end
      it '新規登録を押すと、新規登録画面に遷移する', spec_category: "ルーティング・URL設定(ログイン状況に合わせる)" do
        signup_link = find_all('a')[5].text
        click_link signup_link
        is_expected.to eq '/users/sign_up'
      end
    end
  end

  describe 'ユーザ新規登録のテスト' do
    before do
      visit new_user_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい', spec_category: "devise機能" do
        expect(current_path).to eq '/users/sign_up'
      end
      it '「新規登録」と表示される', spec_category: "devise機能" do
        expect(page).to have_content '新規登録'
      end
      it 'ユーザー名フォームが表示される', spec_category: "devise機能" do
        expect(page).to have_field 'user[name]'
      end
      it 'emailフォームが表示される', spec_category: "devise機能" do
        expect(page).to have_field 'user[email]'
      end
      it 'passwordフォームが表示される', spec_category: "devise機能" do
        expect(page).to have_field 'user[password]'
      end
      it 'passwordフォーム（確認用）が表示される', spec_category: "devise機能" do
        expect(page).to have_field 'user[password_confirmation]'
      end
      it '登録ボタンが表示される', spec_category: "devise機能" do
        expect(page).to have_button '登録'
      end
    end

    context '新規登録成功のテスト' do
      before do
        fill_in 'user[name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
      end

      it '正しく新規登録される', spec_category: "CRUD機能に対するコントローラの処理と流れ(ログイン状況を反映)" do
        expect { click_button '登録' }.to change(User.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先が、トップ画面になっている', spec_category: "CRUD機能に対するコントローラの処理と流れ(ログイン状況を反映)" do
        click_button '登録'
        expect(current_path).to eq '/'
      end
    end
  end

  describe 'ユーザログイン' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい', spec_category: "devise機能" do
        expect(current_path).to eq '/users/sign_in'
      end
      it '「ログイン」と表示される', spec_category: "devise機能" do
        expect(page).to have_content 'ログイン'
      end
      it 'emailアドレスフォームが表示される', spec_category: "devise機能" do
        expect(page).to have_field 'user[email]'
      end
      it 'パスワードフォームが表示される', spec_category: "devise機能" do
        expect(page).to have_field 'user[password]'
      end
      it 'ログインボタンが表示される', spec_category: "devise機能" do
        expect(page).to have_button 'ログイン'
      end
    end

    context 'ログイン成功のテスト' do
      before do
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
      end

      it 'ログイン後のリダイレクト先が、ログインしたユーザのマイページ画面になっている', spec_category: "CRUD機能に対するコントローラの処理と流れ(ログイン状況を反映)" do
        expect(current_path).to eq '/users/my_page'
      end
    end

    context 'ログイン失敗のテスト' do
      before do
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'ログイン'
      end

      it 'ログインに失敗し、ログイン画面にリダイレクトされる', spec_category: "CRUD機能に対するコントローラの処理と流れ(ログイン状況を反映)" do
        expect(current_path).to eq '/users/sign_in'
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end

    context 'ヘッダーの表示を確認' do
      it 'AWARD FOR YOUリンクが表示される: 左上から1番目のリンクが「AWARD FOR YOU」である', spec_category: "ログイン状況に合わせた画面表示や機能制限のロジック設定" do
        logo_link = find('a.navbar-brand')
        expect(logo_link[:href]).to eq root_path
      end
      it '使い方リンクが表示される: 左上から2番目のリンクが「使い方」である', spec_category: "ログイン状況に合わせた画面表示や機能制限のロジック設定" do
        how_to_use_link = find_all('a')[1].text
        expect(how_to_use_link).to match(/使い方/)
      end
      it 'アワード一覧リンクが表示される: 左上から3番目のリンクが「アワード一覧」である', spec_category: "ログイン状況に合わせた画面表示や機能制限のロジック設定" do
        award_index_link = find_all('a')[2].text
        expect(award_index_link).to match(/アワード一覧/)
      end
      it '大賞一覧リンクが表示される: 左上から4番目のリンクが「大賞一覧」である', spec_category: "ログイン状況に合わせた画面表示や機能制限のロジック設定" do
        grand_prize_index_link = find_all('a')[3].text
        expect(grand_prize_index_link).to match(/大賞一覧/)
      end
      it 'マイページリンクが表示される: 左上から5番目のリンクが「マイページ」である', spec_category: "ログイン状況に合わせた画面表示や機能制限のロジック設定" do
        my_page_link = find_all('a')[4].text
        expect(my_page_link).to match(/マイページ/)
      end

      it 'おしらせリンクが表示される', spec_category: "ログイン状況に合わせた画面表示や機能制限のロジック設定" do
        notification_link = find_all('button')[1].text
        expect(notification_link).to match(/おしらせ/)
      end

      it 'ログアウトリンクが表示される: 左上から7番目のリンクが「ログアウト」である', spec_category: "ログイン状況に合わせた画面表示や機能制限のロジック設定" do
        logaout_link = find_all('a')[5].text
        expect(logaout_link).to match(/ログアウト/)
      end
    end

    context 'リンクの内容を確認' do
      subject { current_path }

      it '使い方を押すと、アバウト画面の使い方の部分に遷移する', spec_category: "ルーティング・URL設定(ログイン状況に合わせる)" do
        click_link '使い方'
        expect(page).to have_css('#how_to_use')
        expect(current_url).to include('#how_to_use')
      end
      it 'マイページを押すと、マイページに遷移する', spec_category: "ルーティング・URL設定(ログイン状況に合わせる)" do
        my_page_link = find_all('a')[4].text
        click_link my_page_link
        is_expected.to eq '/users/my_page'
      end
    end
  end

  describe 'ユーザログアウトのテスト' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      logout_link = find_all('a')[5].text
      click_link logout_link
    end

    context 'ログアウト機能のテスト' do
      it '正しくログアウトできている: ログアウト後のリダイレクト先においてログイン画面へのリンクが存在する', spec_category: "CRUD機能に対するコントローラの処理と流れ(ログイン状況を反映)" do
        expect(page).to have_link '', href: '/users/sign_in'
      end
      it 'ログアウト後のリダイレクト先が、ログイン画面になっている', spec_category: "CRUD機能に対するコントローラの処理と流れ(ログイン状況を反映)" do
        expect(current_path).to eq '/users/sign_in'
      end
    end
  end
end
