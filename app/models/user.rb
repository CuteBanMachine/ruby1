class User < ApplicationRecord
  has_many :todo_lists, dependent: :destroy

  validates :name, presence: true
end
