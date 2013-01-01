# coding: utf-8
feature '访问者希望看到帖子的详细信息' do
  background do
    @node = Node.create name: "Ruby"
    @topic = Topic.create title: "topic 1 test", content: "topic 1 content",  node: @node
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
end