require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test 'should get index' do
    get products_url
    assert_response :success
  end

  test 'should get new' do
    get new_product_url
    assert_response :success
  end

  # test 'should create product' do
  #   assert_difference('Product.count') do
  #     post products_url, params: {
  #       product: {
  #         name: @product.name, company: @product.company,
  #         template_id: @product.template_id, properties: @product.properties,
  #         status: @product.status, year: @product.year,
  #         warranty: @product.warranty, warranty_end: @product.warranty_end,
  #         end_of_lifetime: @product.end_of_lifetime
  #       }
  #     }
  #   end
  #
  #   assert_redirected_to product_url(Product.last)
  # end

  # test 'should show product' do
  #   get product_url(@product)
  #   assert_response :success
  # end

  test 'should get edit' do
    get edit_product_url(@product)
    assert_response :success
  end

  test 'should update product' do
    patch product_url(@product), params: {
      product: {
        company: @product.company, name: @product.name,
        properties: @product.properties, status: @product.status,
        template_id: @product.template_id, warranty: @product.warranty,
        year: @product.year
      }
    }
    assert_redirected_to product_url(@product)
  end

  test 'should destroy product' do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
