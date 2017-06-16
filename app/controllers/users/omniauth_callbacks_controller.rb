class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def vkontakte
    # Логику поиска в базе пользователя или создания нового мы отдаем
    # методу модели, передав ему ответ сервера ВКонтакте с информацией
    # о пользователе, которая лежит в специальном объекте
    @user = User.find_for_vkontakte_oauth(request.env['omniauth.auth'])
    @user.avatar

    # Дальше все стандартно, если пользователь создался или нашелся
    if @user.persisted?
      # Пишем, что все хорошо, доставая перевод из спец. файла
      # переводов девайса и вызываем девайсовский метод, который
      # аутентифицирует юзера и направит туда, где он нажал кнопку
      flash[:notice] = I18n.t(
          'devise.omniauth_callbacks.success', kind: 'Vkontakte'
      )
      sign_in_and_redirect @user, event: :authentication
    else
      # Если же что-то пошло не так, пишем об ошибке и шлем на главную
      flash[:error] = I18n.t(
          'devise.omniauth_callbacks.failure', kind: 'Vkontakte', reason: 'authentication error'
      )
      redirect_to root_path
    end
  end
end
