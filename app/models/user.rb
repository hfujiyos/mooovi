class User < ActiveRecord::Base
  # 2018/05/05 ADD(S) HFUJIYOS
  # 入力必須設定
  validates :nickname, presence: true
  # 2018/05/05 ADD(E) HFUJIYOS         

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # 2018/05/05 ADD(S) HFUJIYOS
  has_many :reviews
  # 2018/05/05 DEL(S) HFUJIYOS

  # 2018/05/05 ADD(S) HFUJIYOS
  # アバター設定
  has_attached_file :avatar,
                      styles:  { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :avatar,
                                      content_type: ["image/jpg","image/jpeg","image/png"]
  # 2018/05/05 ADD(E) HFUJIYOS         
end
