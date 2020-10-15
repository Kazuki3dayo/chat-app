class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
  end
  #   @roomには、Room.find(params[:room_id])と記述することで、paramsに含まれているroom_idを代入します。
  # 紐解いて説明すると、直前の問題にあった通りルーティングをネストしているため/rooms/:room_id/messagesといったパスになります。
  # パスにroom_idが含まれているため、paramsというハッシュオブジェクトの中に、room_idという値が存在しています。
  # そのため、params[:room_id]と記述することでroom_idを取得できます。

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room) #@roomがパスを持っているのでこの記述になる
    else
      render :index
    end
  end
  # @room.messages.newでチャットルームに紐づいたメッセージのインスタンスを生成し、message_paramsを引数にして、privateメソッドを呼び出します。
  # その値を@messageに代入し、saveメソッドでメッセージの内容をmessagesテーブルに保存します。

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
  # privateメソッドとしてmessage_paramsを定義し、メッセージの内容(content)をmessagesテーブルへ保存できるようにします。
  # パラメーターの中に、ログインしているユーザーのidと紐付いている、メッセージの内容(content)を受け取れるように許可します。

end
