class SessionsController < ApplicationController
  def new
  end

  def create
  		#入力されたemailから検索してfindする
    user = User.find_by(email: params[:session][:email].downcase)
    # userが存在する＝true かつ(&&) authenticateで、(空だとfalse返ってくる)
    #「DB内のパスワードのハッシュ」と「入力パスワードのハッシュ」が同じであることを確認する(違うとfalse返ってくる)
    #暗号化のため、あくまでパスワードそのものではなく、ハッシュの比較をしている。
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in user
      redirect_to user #user_url(user)と同義
    else
      # エラーメッセージを作成する
      #通常のflashだと、リダイレクト後１回目のページまでフラッシュが残るため、次のページで表示されてしまう
      #flash.nowは今のページだけ表示するため、renderを使えば(リダイレクトでない)、メッセージを表示し、次には持ち越さない
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
