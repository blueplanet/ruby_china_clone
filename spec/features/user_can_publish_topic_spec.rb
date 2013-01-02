# coding: utf-8
feature '用户希望公开帖子' do
  background do
    @user = User.create name: 'test_user'

    @ruby_node = Node.create name: "Ruby"
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
    page.should have_select "topic_node_id", options: Node.all.map { |node| node.name }
    page.should have_field 'topic_title'
    page.should have_field 'topic_content'
  end

  scenario '输入节点、标题、内容，点击"保存"按钮，应该正常提交并显示帖子列表' do
    click_link "发布新帖"

    select @ruby_node.name, from: 'topic_node_id'
    fill_in 'topic_title', with: 'new topic title'
    fill_in 'topic_content', with: 'new topic content'

    click_button "保存"

    current_path.should == root_path
    page.should have_content 'new topic title'
  end
end