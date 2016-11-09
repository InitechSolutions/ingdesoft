require 'test_helper'

class FavorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favor = favors(:one)
  end

  test "should get index" do
    get favors_url
    assert_response :success
  end

  test "should get new" do
    get new_favor_url
    assert_response :success
  end

  test "should create favor" do
    assert_difference('Favor.count') do
      post favors_url, params: { favor: { descripcion: @favor.descripcion, lugar: @favor.lugar, titulo: @favor.titulo } }
    end

    assert_redirected_to favor_url(Favor.last)
  end

  test "should show favor" do
    get favor_url(@favor)
    assert_response :success
  end

  test "should get edit" do
    get edit_favor_url(@favor)
    assert_response :success
  end

  test "should update favor" do
    patch favor_url(@favor), params: { favor: { descripcion: @favor.descripcion, lugar: @favor.lugar, titulo: @favor.titulo } }
    assert_redirected_to favor_url(@favor)
  end

  test "should destroy favor" do
    assert_difference('Favor.count', -1) do
      delete favor_url(@favor)
    end

    assert_redirected_to favors_url
  end
end
