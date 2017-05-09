require 'test_helper'

class Admin::QoutesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_qoute = admin_qoutes(:one)
  end

  test "should get index" do
    get admin_qoutes_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_qoute_url
    assert_response :success
  end

  test "should create admin_qoute" do
    assert_difference('Admin::Qoute.count') do
      post admin_qoutes_url, params: { admin_qoute: { description: @admin_qoute.description, enable: @admin_qoute.enable } }
    end

    assert_redirected_to admin_qoute_url(Admin::Qoute.last)
  end

  test "should show admin_qoute" do
    get admin_qoute_url(@admin_qoute)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_qoute_url(@admin_qoute)
    assert_response :success
  end

  test "should update admin_qoute" do
    patch admin_qoute_url(@admin_qoute), params: { admin_qoute: { description: @admin_qoute.description, enable: @admin_qoute.enable } }
    assert_redirected_to admin_qoute_url(@admin_qoute)
  end

  test "should destroy admin_qoute" do
    assert_difference('Admin::Qoute.count', -1) do
      delete admin_qoute_url(@admin_qoute)
    end

    assert_redirected_to admin_qoutes_url
  end
end
