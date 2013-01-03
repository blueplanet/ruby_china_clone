# coding: utf-8
feature '访问者希望看到一个节点的帖子列表' do
  background do
    user = User.create name: 'test_user'

    @node1 = Node.create name: "Ruby Node", description: "Ruby是一门优美的语言"
    @node2 = Node.create name: "Rails Node", description: "Rails是一个快速WEB开发框架"

    2.times.map.with_index { |i| Topic.create title: "topic #{i}", node: @node1, author: user}
    3.times.map.with_index { |i| Topic.create title: "topic #{i + 10}", node: @node2, author: user}
  end

  scenario '点击节点名称后，应该显示该节点的帖子列表' do
    visit '/topics'

    Node.all.each do |node|
      page.should have_content node.name
    end

    first(:link, @node1.name).click

    page.should have_content @node1.name
    page.should have_content @node1.description

    page.should_not have_content @node2.name
    page.should_not have_content @node2.description
  end
end
