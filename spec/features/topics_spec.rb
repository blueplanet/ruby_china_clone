# coding: utf-8
feature '访问者希望看到所有帖子' do
  background do
    node = Node.create name: "瞎扯淡"
    @user = User.create name: 'test_user'

    Topic.create title: "DHH 的公开课", node: node, author: @user
    Topic.create title: "Rails3 中 compass 的 IE 使用问题", node: node, author: @user
    Topic.create title: "这周二上海搞Ruby Tuesday么？", node: node, author: @user

    Topic.last.replies.create content: 'test replay', user: @user
  end

  context "访问/topics" do
    before do
      visit '/topics'
    end

    scenario '应该显示所有帖子' do
      Topic.all.each { |topic| page.should have_content topic.title }

      page.should have_content "published less than a minute ago"
    end

    scenario '应该显示帖子的节点名称' do
      Topic.all.each { |topic| page.should have_content topic.node.name } 
    end

    scenario '应该显示帖子创建者名称' do
      page.should have_content @user.name
    end

    scenario '应该显示帖子的最新回复的信息' do
      page.should have_content "last replied by #{@user.name} less than a minute ago"
    end
  end
end