class Product < ActiveRecord::Base
  belongs_to :admin
  has_and_belongs_to_many :categories
  has_many :orders
  has_many :users, through: :orders

  before_create :round_price

  validates :name, :description, :list_price, :quantity, presence: true
  validates :list_price, numericality: { greater_than: 0 }
  validates :name, length: { maximum: 100 }
  validates :description, length: { maximum: 1000 }

  private
  def round_price
    self.list_price = self.list_price.round(2)
  end
end
