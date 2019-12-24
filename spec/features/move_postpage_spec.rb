require "rails_helper"

RSpec.feature "Moving Detail Page" do
  # シナリオを作成
  scenario "A user moves a detail page" do
    # 投稿一覧を指定
    visit "/posts"

    # 投稿ボタンを押下
    click_link "投稿"

    # 遷移先のページに投稿者名の文言があるか
    expect(page).to have_content("投稿者名")
    # /posts -> /posts/newにURLが遷移するか
    expect(page.current_path).to eq(new_post_path)

  end
end
