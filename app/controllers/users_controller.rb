class UsersController < ApplicationController

  def edit
  end

  def update  #updateアクション内で、保存できた場合とできなかった場合で条件分岐の処理を行います。
    if current_user.update(user_params)  #ユーザー情報が格納されているcurrent_userメソッドを使用して、ログインしているユーザーの情報を更新する。
      redirect_to root_path #current_user.updateに成功した場合、root（チャット画面）にリダイレクトします。
    else  #失敗した場合、render :editとeditのアクションを指定しているため、editのビューが表示されます。
      render :edit
    end
  end


  private

  def user_params #ストロングパラメーターを使用し、user_paramsを定義
    params.require(:user).permit(:name, :email) #permitメソッドを使用し、「name」と「email」の編集を許可する。
  end

end