class Product < ActiveRecord::Base
  has_many :reviews
  
  # 2018/05/05 ADD(S) HFUJIYOS
  def review_average
    self.reviews.average(:rate).round
  end
  # 2018/05/05 ADD(S) HFUJIYOS
end
