class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # *********************************************************
  # ApplicationController
  #  ├──UsersController
  #  └──RankingController
  #      ├──ProductController
  #      └──ReviewsController
  # *********************************************************
  protect_from_forgery with: :exception

  # 2018/05/05 ADD(S) HFUJIYOS
  # devise_controllerが動いた時のみ、
  # sign_upアクションが実行される際にnicknmameとavatarをパラメーターとして許可する
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :avatar])
  end
  
  # サインアウトしたらリダイレクト
  def after_sign_out_path_for(resource)
    '/users/sign_in' # サインアウト後のリダイレクト先URL
  end
  # 2018/05/05 ADD(E) HFUJIYOS
end
