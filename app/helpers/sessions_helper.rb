module SessionsHelper

  # 渡されたユーザーでログインする
  	#一時cookiesに暗号化済みuser idが自動で生成される
  	#この後、session[:user_id]でユーザーidを元通りに取り出すことができる
  	#一時cookiesを盗まれても、本物のユーザーとしてログインできなくなる。
  	#このsessionは、controller関係なく、railsで定義済みsessionメゾット
      #||= について    C言語のx += 1と同じ概念
      #分解すると @current_user = @current_user || User.find_by(...)
      #になるが、rubyでは、||演算子を左から読み、trueになった時点で止める。
      #もし、@current_userにnil以外が入っていれば(true)
      #そのまま@current_userを代入して終了
      #もし、@current_userがnil(flase)なら
      #user.find_by(...)を代入する
      #これは、@current_userに1度値を入れたら、何度もfind_byしたくないから(遅くなる)

  # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end

  # 現在ログイン中のユーザーを返す (いる場合)
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end

  # 現在のユーザーをログアウトする
  def log_out
    session.delete(:user_id) #session id を nilにする
    @current_user = nil
  end

end
