require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "should not save product without name" do
    product = Product.new(price: 10, description: "A valid description")
    assert_not product.save, "Saved the product without a name"
  end

  test "should not save product without price" do
    product = Product.new(name: "Valid Name", description: "A valid description")
    assert_not product.save, "Saved the product without a price"
  end

  test "should not save product without description" do
    product = Product.new(name: "Valid Name", price: 10)
    assert_not product.save, "Saved the product without a description"
  end

  test "should not save product with duplicate name" do
    product1 = Product.new(name: "Unique Name", price: 10, description: "A valid description")
    product1.save
    product2 = Product.new(name: "Unique Name", price: 20, description: "Another valid description")
    assert_not product2.save, "Saved the product with a duplicate name"
  end

  test "should not save product with price less than or equal to zero" do
    product = Product.new(name: "Valid Name", price: 0, description: "A valid description")
    assert_not product.save, "Saved the product with a price less than or equal to zero"
  end

  test "vencido should return 'Vencido' if entrada is 0" do
    assert_equal "Vencido", Product.vencido(0)
  end

  test "vencido should return 'Vigente' if entrada is not 0" do
    assert_equal "Vigente", Product.vencido(1)
  end

  test "on_sale should return 'En oferta' if price is less than 50" do
    assert_equal "En oferta", Product.on_sale(49)
  end

  test "on_sale should return 'Precio regular' if price is 50 or more" do
    assert_equal "Precio regular", Product.on_sale(50)
  end

  test "price_with_tax should return price with 18% tax if price is greater than 0" do
    assert_equal 11.8, Product.price_with_tax(10)
  end

  test "price_with_tax should return 'Precio no válido' if price is less than or equal to 0" do
    assert_equal "Precio no válido", Product.price_with_tax(0)
  end

  test "expensive should return 'Producto costoso' if price is greater than 100" do
    assert_equal "Producto costoso", Product.expensive(101)
  end

  test "expensive should return 'Producto accesible' if price is 100 or less" do
    assert_equal "Producto accesible", Product.expensive(100)
  end

  test "available_stock should return 'Stock disponible' if stock is greater than 0" do
    assert_equal "Stock disponible", Product.available_stock(1)
  end

  test "available_stock should return 'Sin stock' if stock is 0 or less" do
    assert_equal "Sin stock", Product.available_stock(0)
  end

  test "long_name should return 'Nombre largo' if name length is greater than 20" do
    assert_equal "Nombre largo", Product.long_name("This is a very long name")
  end

  test "long_name should return 'Nombre corto' if name length is 20 or less" do
    assert_equal "Nombre corto", Product.long_name("Short name")
  end
end