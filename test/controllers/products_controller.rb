require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end 

  # 1. validar que la página de edición cargue correctamente.
  test "validate that the edit page loads correctly" do 
    get edit_product_path(@product)
    assert_response :success
  end

  # 2. validar que la página muestre el título "Product Edition" con el formato h2
  test "validate that the page displays the title Product Edition with the h2 format" do
    get edit_product_path(@product)
    assert_response :success 
    assert_select "h2", "Product Edition"  # verificamos que la pagina muestre con h2 el título
  end

  # 3. validar que se muestre el mensaje "Product no registered" cuando el producto no exista
  test "Validate that the message Product not registered is displayed when the product does not exist" do
    get edit_product_path(id: -1)
    assert_response :success
    assert_select "p", "Product no registered"
  end

  # 4. validar que se inhabilite el botón para guardar los cambios si alguno de los campos se encuentra en blanco.
  test "validate that the button to save changes is disabled if any of the fields are blank" do
    @product = Product.new(name: "", price: nil, description: "")  # No se guarda en la BD
    get edit_product_path(@product)
    assert_response :success
    assert_select "input[type=submit][disabled]", true  # Verifica que el botón está deshabilitado
  end
  
  
   

end  # <-- Cierre correcto de la clase




# test "should get index" do
#   get products_url
#   assert_response :success
# end

# test "should get new" do
#   get new_product_url
#   assert_response :success
# end

# test "should create product" do
#   assert_difference("Product.count") do
#     post products_url, params: { product: { description: @product.description, name: @product.name, price: @product.price } }
#   end
#   assert_redirected_to product_url(Product.last)
# end

# test "should show product" do
#   get product_url(@product)
#   assert_response :success
# end

# test "should get edit" do
#   get edit_product_url(@product)
#   assert_response :success
# end

# test "should update product" do
#   patch product_url(@product), params: { product: { description: @product.description, name: @product.name, price: @product.price } }
#   assert_redirected_to product_url(@product)
# end

# test "should destroy product" do
#   assert_difference("Product.count", -1) do
#     delete product_url(@product)
#   end
#   assert_redirected_to products_url
# end

# test de validacion de productos 
# test "validamos que el producto tenga nombre" do
#   product = Product.new(price:1200, description:"notificacion")
#   assert_not product.valid?
# end

# test de validacion de precio
# test "validamos que el producto tenga precio" do
#   product = Product.new(name:"funda", price:0, description:"notificacion")
#   product.valid?
#   assert_includes product.errors[:price], "must be greater than 0"
# end
