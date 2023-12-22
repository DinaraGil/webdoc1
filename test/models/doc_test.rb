require "test_helper"

class DocTest < ActiveSupport::TestCase
  def setup
    @doc = Doc.new(title: "Sample Doc", body: "This is a sample document.")
  end

  test "should be valid" do
    assert @doc.valid?
  end

  test "title should be present" do
    @doc.title = ""
    assert_not @doc.valid?
  end

  test "body should be present" do
    @doc.body = ""
    assert_not @doc.valid?
  end

  test "should save valid doc" do
    assert @doc.save
  end

  test "should have many users_docs" do
    assert_respond_to @doc, :users_docs
  end
end
