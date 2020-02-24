ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # テストユーザーがログイン中の場合にtrueを返す
  # 通常のhelperは、テスト中に呼び出せないため、代用をここに書く
  def is_logged_in?
    !session[:user_id].nil?
  end



  # Add more helper methods to be used by all tests here...
end
