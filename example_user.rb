class User
  attr_accessor :name, :email #代入するあたいによって型が動的に変化する変数 attr_accessor

  def initialize(attributes = {}) #User.newすると自動で呼び出される　特殊なメゾット
    @name  = attributes[:name] #formatted_emailで使いたいのでインスタンスで@name @email作成
    @email = attributes[:email]
  end

  def formatted_email
    "#{@name} <#{@email}>" #@nameと@emailに割り当てられた値をユーザーのメールアドレスとして構成します。
  end
end