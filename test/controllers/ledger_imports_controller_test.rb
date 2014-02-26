require 'test_helper'

class LedgerImportsControllerTest < ActionController::TestCase
  setup do
    @ledger_import = ledger_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ledger_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ledger_import" do
    assert_difference('LedgerImport.count') do
      post :create, ledger_import: { item_description: @ledger_import.item_description, item_price: @ledger_import.item_price, merchant_address: @ledger_import.merchant_address, merchant_name: @ledger_import.merchant_name, purchase_count: @ledger_import.purchase_count, purchaser_name: @ledger_import.purchaser_name }
    end

    assert_redirected_to ledger_import_path(assigns(:ledger_import))
  end

  test "should show ledger_import" do
    get :show, id: @ledger_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ledger_import
    assert_response :success
  end

  test "should update ledger_import" do
    patch :update, id: @ledger_import, ledger_import: { item_description: @ledger_import.item_description, item_price: @ledger_import.item_price, merchant_address: @ledger_import.merchant_address, merchant_name: @ledger_import.merchant_name, purchase_count: @ledger_import.purchase_count, purchaser_name: @ledger_import.purchaser_name }
    assert_redirected_to ledger_import_path(assigns(:ledger_import))
  end

  test "should destroy ledger_import" do
    assert_difference('LedgerImport.count', -1) do
      delete :destroy, id: @ledger_import
    end

    assert_redirected_to ledger_imports_path
  end
end
