class UsersController < ApplicationController
    require 'net/http'

  def create
    # ユーザーの作成・ログイン
    id_token = params[:idToken]
    #環境変数に代入LINEログインチャネルのチャネルID
    channel_id = ENV['CHANNEL_ID']
    params = { id_token: id_token, client_id: channel_id }
    uri = URI.parse('https://api.line.me/oauth2/v2.1/verify')
    response_json = Net::HTTP.post_form(uri, params)
    line_id = JSON.parse(response_json.body)['sub']
    line_name = JSON.parse(response_json.body)['name']
    if line_id # IDトークンの対象ユーザーID
      @user = User.find_by(line_id: line_id)
      @user = User.create!(line_id: line_id, name: line_name) if @user.nil?
      session[:user_id] = @user.id
    else
    # render しなくてもステータスコードを返す
      render status: :internal_server_error
    end
  end

end
