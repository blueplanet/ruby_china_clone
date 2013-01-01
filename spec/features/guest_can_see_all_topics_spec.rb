# coding: utf-8
feature '访问者希望看到所有帖子的列表' do
  background do
    Topic.delete_all

    node = Node.create name: "瞎扯淡"

    Topic.create title: "DHH 的公开课", node: node
    Topic.create title: "Rails3 中 compass 的 IE 使用问题", node: node
    Topic.create title: "这周二上海搞Ruby Tuesday么？", node: node
  end

  scenario '访问/topics, 应该显示所有帖子' do
    visit '/topics'

    Topic.all.each do |topic|
      page.should have_content topic.title
    end

    page.should have_content "published less than a minute ago"
  end
end