class RankingController < ApplicationController
  layout 'review_site'
  
  # 2018/05/05 ADD(S) HFUJIYOS
  # *********************************************************
  # 関    数：before_action
  # コメント：コントローラが呼び出された時にアクション共通で
  #           最初に実行するメソッドを定義します
  # *********************************************************
  before_action :ranking
  def ranking
    # 2018/05/05 UPD(S) HFUJIYOS
    # @ranking = Product.limit(5)
    product_ids = Review.group(:product_id).order('count_product_id DESC').limit(5).count(:product_id).keys
    @ranking = product_ids.map { |id| Product.find(id) }
    # 2018/05/05 UPD(E) HFUJIYOS
  end
  # 2018/05/05 ADD(E) HFUJIYOS
end
