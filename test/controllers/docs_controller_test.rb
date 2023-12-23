require "test_helper"

class DocsControllerTest < ActionDispatch::IntegrationTest
  #используются фикстуры - набор данных для тестов
  setup do
    @doc = docs(:one)
  end

  test "should get index" do
    get docs_url
    assert_response :success
  end

  test "should get new" do
    post users_path, params: { user: { name: 'John Doe', email: 'john@example.com', password: 'password' } }

    assert_redirected_to root_path

    post session_path, params: { session: { email: 'john@example.com', password: 'password' } }
    assert_redirected_to root_path

    get new_doc_url
    assert_response :success
  end

  test "should create doc" do
    post users_path, params: { user: { name: 'John Doe', email: 'john@example.com', password: 'password' } }

    assert_redirected_to root_path

    post session_path, params: { session: { email: 'john@example.com', password: 'password' } }
    assert_redirected_to root_path

    assert_difference('Doc.count') do
      post docs_url, params: { doc: { title: @doc.title, body: @doc.body } }
    end

    assert_redirected_to doc_url(Doc.last)
  end

  test "should show doc" do
    post users_path, params: { user: { name: 'John Doe', email: 'john@example.com', password: 'password' } }

    assert_redirected_to root_path

    post session_path, params: { session: { email: 'john@example.com', password: 'password' } }
    assert_redirected_to root_path

    get doc_url(@doc)
    assert_response :success
  end

  test "should get edit" do
    post users_path, params: { user: { name: 'John Doe', email: 'john@example.com', password: 'password' } }

    assert_redirected_to root_path

    post session_path, params: { session: { email: 'john@example.com', password: 'password' } }
    assert_redirected_to root_path

    get edit_doc_url(@doc)
    assert_response :success
  end

  test "should update doc" do
    post users_path, params: { user: { name: 'John Doe', email: 'john@example.com', password: 'password' } }

    assert_redirected_to root_path

    post session_path, params: { session: { email: 'john@example.com', password: 'password' } }
    assert_redirected_to root_path

    patch doc_url(@doc), params: { doc: { title: "Updated Title", body: "Updated Body" } }
    assert_redirected_to doc_url(@doc)
    @doc.reload
    assert_equal "Updated Title", @doc.title
    assert_equal "Updated Body", @doc.body
  end
end
