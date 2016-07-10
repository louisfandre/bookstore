class Book < ActiveRecord::Base
  belongs_to :category
  belongs_to :author
  belongs_to :publisher

  validates :title, presence: :true
  validates :author, presence: :true
  validates :publisher, presence: :true


end
