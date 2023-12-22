require "test_helper"

class UsersDocsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doc = docs(:one)  # предполагаем, что у вас есть фикстура для теста
  end

  test "should create users_doc" do
    post doc_users_docs_path(@doc), params: {
        users_doc: {
          username: 'JohnDoe',
          body: 'Some text',
          title: 'Document Title'
        },
        turbo: false
      }
    assert_redirected_to doc_path(@doc)
  end

  test "should not create users_doc without title" do
    post doc_users_docs_path(@doc), params: {
      users_doc: {
        username: 'JohnDoe',
        body: 'Some text'
      },
      turbo: false
    }
    assert_redirected_to doc_path(@doc)
    assert_equal 'Укажите название Вашего заявления.', flash[:alert]
  end

  test "should show users_doc" do
    users_doc = users_docs(:one)  # предполагаем, что у вас есть фикстура для теста
    @doc.users_docs.each do |ud|
      get doc_users_doc_path(users_doc, ud) 
      assert_response :success
    end
  end

  test "should show users_doc as PDF" do
    users_doc = users_docs(:one)  # предполагаем, что у вас есть фикстура для теста
    @doc.users_docs.each do |ud|
      get doc_users_doc_path(users_doc, ud, format: :pdf)
      assert_response :success
      assert_equal "application/pdf", response.content_type
    end
  end
end
