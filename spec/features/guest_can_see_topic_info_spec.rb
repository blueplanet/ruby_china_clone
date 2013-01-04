# coding: utf-8
feature '访问者希望看到帖子的详细信息' do
  background do
    @node = Node.create name: "Ruby"
    @topic = Topic.create title: "topic 1 test", content: "topic 1 content",  node: @node

    5.times.map.with_index { |i| Reply.create content: "reply #{i}", topic: @topic }
  end

  scenario '访问/topics/1, 应该显示帖子的详细信息' do
    visit "/topics/#{@topic.id}"

    page.should have_content @topic.title
    page.should have_content @topic.content
    page.should have_content @topic.node.name
    page.should have_content "published #{@topic.created_at} ago"

    page.should have_link "Home", href: root_path
    page.should have_link @topic.node.name, href: node_path(@topic.node)
    page.should have_link "浏览帖子", href: topic_path(@topic)
  end

  scenario '应该显示帖子的回复信息' do
    visit "/topics/#{@topic.id}"

    page.should have_content "共收到 #{@topic.replies.count} 条回复"

    @topic.replies.each do |reply|
      page.should have_content reply.content
    end
  end  

  scenario '应该显示回复用的form' do
    visit "/topics/#{@topic.id}"

    page.should have_field 'reply_content'
    page.should have_button '提交回复'
  end

  scenario '输入回复内容点击"提交回复"后，正常提交回复' do
    visit "/topics/#{@topic.id}"

    fill_in 'reply_content', with: "回复测试"
    click_button "提交回复"

    current_path.should == topic_path(@topic)

    page.should have_content "回复测试"
  end
end