# coding: utf-8
feature '访问者希望注册用户' do
  scenario '访问/sign_up, 应该显示注册用页面' do
    visit '/sign_up'

    page.should have_field "user_name"
    page.should have_field "user_email"
  end

  scenario '输入用户名和Email，点击"提交注册信息"按钮，应该显示首页' do
    visit '/sign_up'

    fill_in "user_name", with: "test_user"
    fill_in "user_email", with: "test@test.com"

    click_button "提交注册信息"

    current_path.should == root_path
  end
end