require 'test_helper'

class ArticleFlowTest < ActionDispatch::IntegrationTest
  test "can see the welcome page" do
    get "/"
    assert_select "h1", "Welcome#index"
  end

  test "can create an article" do
    get "/articles/new"
    assert_response :success
   
    post "/articles",
      params: { article: { text: "can create", body: "article successfully." } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", "Text:\n  can create"    #There must be 2 whitespaces b/w 'Text:\n' & 'can create'.
  end
end
