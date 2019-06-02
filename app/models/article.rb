class Article < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :text, presence: true

  def self.ordered
    order(id: :desc)
  end

  def create_comment(params)
    comments.create(params)
  end

end
