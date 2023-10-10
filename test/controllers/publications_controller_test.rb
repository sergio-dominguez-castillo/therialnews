require "test_helper"

class PublicationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @publication = publications(:one)
  end

  # nota:
  # para ejecutar esta prueba
  # rails t test/controllers/publications_controller_test.rb -n test_should_get_index
  test "should get index" do
    get publications_url
    assert_response :success
    assert_equal 200, response.status
    assert_equal "utf-8", response.charset
  end

  # nota:
  # para ejecutar esta prueba
  # rails t test/controllers/publications_controller_test.rb -n test_should_get_new
  test "should get new" do
    sign_in users(:one)
    get new_publication_url
    assert_response :success
    
  end

  # nota:
  # para ejecutar esta prueba
  # rails t test/controllers/publications_controller_test.rb -n test_should_create_publication
  test "should create publication" do
    assert_difference("Publication.count") do
      sign_in users(:one)
      post publications_url, params: { publication: { title: @publication.title, 
      description: @publication.description, 
      image: @publication.image, 
      user_id: @publication.user_id } }
    end

    assert_redirected_to publication_url(Publication.last)
  end

  # nota:
  # para ejecutar esta prueba
  # rails t test/controllers/publications_controller_test.rb -n test_should_show_publication
  test "should show publication" do
    get publication_url(@publication)
    assert_response :success
    
  end

  # nota:
  # para ejecutar esta prueba
  # rails t test/controllers/publications_controller_test.rb -n test_should_get_edit
  test "should get edit" do
    #sign_in users(:two)   # admin
    sign_in users(:one)

    get edit_publication_url(@publication)
    assert_response :success
    
  end

  # nota:
  # para ejecutar esta prueba
  # rails t test/controllers/publications_controller_test.rb -n test_should_update_publication
  test "should update publication" do
    #sign_in users(:two)   # admin
    sign_in users(:one)
    patch publication_url(@publication), params: { publication: { title: @publication.title,
    description: @publication.description, 
    image: @publication.image, 
    user_id: @publication.user_id } }
    assert_redirected_to publication_url(@publication)
  end

  # nota:
  # para ejecutar esta prueba
  # rails t test/controllers/publications_controller_test.rb -n test_should_destroy_publication
  test "should destroy publication" do
    #sign_in users(:two)   # admin
    sign_in users(:one)
    assert_difference("Publication.count", -1) do
      delete publication_url(@publication)
    end

    assert_redirected_to publications_url
  end
end
