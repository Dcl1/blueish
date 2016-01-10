require 'test_helper'

class UrlArticlesControllerTest < ActionController::TestCase
  setup do
    @url_article = url_articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:url_articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create url_article" do
    assert_difference('UrlArticle.count') do
      post :create, url_article: { source: @url_article.source }
    end

    assert_redirected_to url_article_path(assigns(:url_article))
  end

  test "should show url_article" do
    get :show, id: @url_article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @url_article
    assert_response :success
  end

  test "should update url_article" do
    patch :update, id: @url_article, url_article: { source: @url_article.source }
    assert_redirected_to url_article_path(assigns(:url_article))
  end

  test "should destroy url_article" do
    assert_difference('UrlArticle.count', -1) do
      delete :destroy, id: @url_article
    end

    assert_redirected_to url_articles_path
  end
end
