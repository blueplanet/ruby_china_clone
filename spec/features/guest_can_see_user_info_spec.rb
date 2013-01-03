# coding: utf-8
feature '访问者希望看到用户的信息' do
  background do
    @user = User.create name: "test_user"
    node = Node.create name: "ruby"

    5.times.map.with_index { |i| Topic.create title: "topic #{i}", node: node, author: @user }
  end

  before do
    visit "/users/#{@user.id}"
  end

  scenario '应该显示用户信息' do
    page.should have_content @user.name
    page.should have_content @user.created_at.to_s
  end

  scenario '应该显示用户最新发布的帖子' do
    Topic.all.each do |topic|
      page.should have_content topic.title
    end
  end
end