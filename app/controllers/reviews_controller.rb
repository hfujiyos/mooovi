class ReviewsController < RankingController
  # 2018/05/05 ADD(S) HFUIYOS
  before_action :authenticate_user!, only: :new
  # 2018/05/05 ADD(E) HFUIYOS
  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    # Review.create(create_params)
    # トップページにリダイレクトする
    # 2018/05/04 ADD(S) HFUJIYOS
    Review.create(create_params)
    redirect_to controller: :products, action: :index
    # 2018/05/04 ADD(E) HFUJIYOS
  end

  private
  def create_params
    # 2018/05/04 ADD(S) HFUJIYOS
    # 2018/05/05 UPD(S) HFUJIYOS
    # params.require(:review).permit(:nickname, :rate, :review).merge(product_id: params[:product_id])
    # params.require(:review).permit(:rate, :review).merge(product_id: params[:product_id], nickname: current_user.nickname)
    params.require(:review).permit(:rate, :review).merge(product_id: params[:product_id], user_id: current_user.id)
    # 2018/05/05 UPD(E) HFUJIYOS
    # 2018/05/04 ADD(E) HFUJIYOS
  end
end
