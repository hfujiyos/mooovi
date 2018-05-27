class ProductsController < RankingController
  # 2018/05/05 ADD(S) HFUIYOS
  before_action :authenticate_user!, only: :search
  # 2018/05/05 ADD(E) HFUIYOS
  
  def index
    # productsテーブルから最新順に作品を２０件取得する
    # 2018/05/04 UPD(S) HFUJIYOS
    # @products = []
    # @products = Product.all
    @products = Product.order('id ASC').limit(20)
    # 2018/05/04 UPD(E) HFUJIYOS
  end

  def show
    # productsテーブルから該当するidの作品情報を取得し@productの変数へ代入する処理を書いて下さい
    # 2018/05/04 UPD(S) HFUIYOS
    # @product = Product.new # 問題3ではこのコードは消して新しくコードを書いてください
    @product = Product.find(params[:id])
    # 2018/05/04 UPD(E) HFUIYOS
  end

  def search
    # 検索フォームのキーワードをあいまい検索して、productsテーブルから20件の作品情報を取得する
    # 2018/05/04 UPD(S) HFUIYOS
    # @products = []
    @products = Product.where('title LIKE(?)', "%#{params[:keyword]}%").limit(20)
    # 2018/05/04 UPD(E) HFUIYOS
  end
end
