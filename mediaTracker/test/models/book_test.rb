require 'test_helper'
#Auto-generated by rails
#Summary: Contains tests for the books model
#Author: Alyssa Langhals
class BookTest < ActiveSupport::TestCase
  test 'create book' do
    book = Book.new(author: 'J K Rowling')
    assert_equal 'J K Rowling', book.author
  end
end
