class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  include SessionsHelper #セッションを実装するヘルパー ここで読み込ませれば、どのコントローラーでも使えるようになる

	def hello
		render html:"hello world"
	end

end
