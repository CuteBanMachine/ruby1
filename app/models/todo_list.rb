class TodoList < ApplicationRecord
  belongs_to :user
  has_many :lists

  validates :name, presence: true
  validates :title, presence: true

end
