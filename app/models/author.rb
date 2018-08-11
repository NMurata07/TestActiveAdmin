class Author < ActiveRecord::Base
  has_many :author_books, dependent: :destroy
  has_many :books, through: :author_books
  accepts_nested_attributes_for :author_books, allow_destroy: true
end
