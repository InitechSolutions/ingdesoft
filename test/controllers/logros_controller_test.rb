require 'test_helper'

class LogrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @logro = logros(:one)
  end

  test "should get index" do
    get logros_url
    assert_response :success
  end

  test "should get new" do
    get new_logro_url
    assert_response :success
  end

  test "should create logro" do
    assert_difference('Logro.count') do
      post logros_url, params: { logro: { max: @logro.max, min: @logro.min, nombre: @logro.nombre } }
    end

    assert_redirected_to logro_url(Logro.last)
  end

  test "should show logro" do
    get logro_url(@logro)
    assert_response :success
  end

  test "should get edit" do
    get edit_logro_url(@logro)
    assert_response :success
  end

  test "should update logro" do
    patch logro_url(@logro), params: { logro: { max: @logro.max, min: @logro.min, nombre: @logro.nombre } }
    assert_redirected_to logro_url(@logro)
  end

  test "should destroy logro" do
    assert_difference('Logro.count', -1) do
      delete logro_url(@logro)
    end

    assert_redirected_to logros_url
  end
end
