require "test_helper"

class UsersDocTest < ActiveSupport::TestCase
  def setup
    @doc = docs(:one)
    @users_doc = UsersDoc.new(username: "John Doe", body: "Document body", doc: @doc, title: "Sample Title")
  end

  test "should be valid" do
    assert @users_doc.valid?
  end

  test "title should be present" do
    @users_doc.title = ""
    assert_not @users_doc.valid?
  end

  test "should belong to a doc" do
    assert_respond_to @users_doc, :doc
  end

  test "should save valid users_doc" do
    assert @users_doc.save
  end

  test "should have associated doc" do
    assert_equal @doc, @users_doc.doc
  end
end
