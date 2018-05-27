class AddRateToProducts < ActiveRecord::Migration
  def change
    add_column :products, :director, :string    # 監督名
    add_column :products, :detail, :text        # あらすじ
    add_column :products, :open_date, :string   # 公開日
  end
end
