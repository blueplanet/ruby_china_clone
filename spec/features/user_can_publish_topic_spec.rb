# coding: utf-8
feature '用户希望公开帖子' do
  background do
    @user = User.create name: 'test_user'

    Node.create name: "Ruby"
    Node.create name: "Rails"
    Node.create name: "XiaCheDan"
  end

  before do
    visit '/sign_in'

    fill_in 'user_name', with: @user.name
    click_button "登录"
  end

  scenario '访问/topics/new，应该显示新建帖子页面' do
    click_link "发布新帖"

    page.should have_content "新建帖子"
    page.should have_select "topic_node", options: Node.all.map { |node| node.name }
    page.should have_field 'topic_title'
    page.should have_field 'topic_content'
  end
end