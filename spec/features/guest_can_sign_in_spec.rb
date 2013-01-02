# coding: utf-8
feature '访问者希望登录' do
  background do
    @user = User.create name: "test_user", email: "test@test.com"
  end

  before do
    visit "/sign_in"

    fill_in "user_name", with: @user.name
    click_button "登录"
  end

  scenario '输入用户名后点击"登录"按钮，应该正常登录' do
    current_path.should == root_path
  end

  scenario '应该显示用户名称' do
    page.should have_content @user.name    
  end
end