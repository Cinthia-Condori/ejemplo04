class Product < ApplicationRecord
  # Validaciones
  validates :name, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { maximum: 500 }

  # 1.  verificar si un producto está vencido
  def self.vencido(entrada)
    if entrada == 0 then
      return "Vencido"
    else
      return "Vigente"
    end
  end

  # 2.  verificar si un producto está en oferta (precio < 50)
  def self.on_sale(price)
    if price < 50 then
      return "En oferta"
    else
      return "Precio regular"
    end
  end

  # 3. calcular el precio con impuesto (IGV 18%)
  def self.price_with_tax(price)
    if price > 0 then
      return (price * 1.18).round(2)
    else
      return "Precio no válido"
    end
  end

  # 4. determinar si un producto es costoso (mayor a 100)
  def self.expensive(price)
    if price > 100 then
      return "Producto costoso"
    else
      return "Producto accesible"
    end
  end

  # 5. verificar si hay stock disponible
  def self.available_stock(stock)
    if stock > 0 then
      return "Stock disponible"
    else
      return "Sin stock"
    end
  end

  # 6. verificar si el nombre del producto es largo (más de 20 caracteres)
  def self.long_name(name)
    if name.length > 20 then
      return "Nombre largo"
    else
      return "Nombre corto"
    end
  end
end
