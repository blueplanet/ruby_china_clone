# coding: utf-8
feature '访问者希望看到一个节点的帖子列表' do
  background do
    @node1 = Node.create name: "Ruby Node"
    @node2 = Node.create name: "Rails Node"

    2.times.map.with_index { |i| Topic.create title: "topic #{i}", node: @node1}
    3.times.map.with_index { |i| Topic.create title: "topic #{i + 10}", node: @node2}
  end

  scenario '点击节点名称后，应该显示该节点的帖子列表' do
    visit '/topics'

    page.should have_content @node1.name
    page.should have_content @node2.name

    first(:link, @node1.name).click

    page.should have_content @node1.name
    page.should_not have_content @node2.name
  end
end
