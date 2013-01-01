# coding: utf-8
feature '访问者希望看到用户的信息' do
  background do
    @user = User.create name: "test_user"
  end

  scenario '访问/users/:id, 应该显示用户信息' do
    visit "/users/#{@user.id}"

    page.should have_content @user.name
    page.should have_content @user.created_at.to_s
  end
end