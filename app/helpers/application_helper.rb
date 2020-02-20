module ApplicationHelper

  # ページごとの完全なタイトルを返します。
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
    	#return 最終行で実行されたものが返る
      base_title
    else
    	#return 最終行で実行されたものが返る
      page_title + " | " + base_title
    end
  end
end