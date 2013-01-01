# coding: utf-8
feature '访问者希望看到帖子的节点名称' do
  background do
    Topic.delete_all

    node = Node.create name: "瞎扯淡"

    Topic.create title: "DHH 的公开课", node: node
    Topic.create title: "Rails3 中 compass 的 IE 使用问题", node: node
    Topic.create title: "这周二上海搞Ruby Tuesday么？", node: node
  end

  scenario do
    visit '/topics'

    page.should have_content '瞎扯淡'
  end
end