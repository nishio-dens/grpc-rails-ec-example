Ec::Product.class_eval do
  PORT = "127.0.0.1:8080"

  def self.all
    service = Ec::ProductService::Stub.new(PORT, :this_channel_is_insecure)
    req = Ec::GetProductsRequest.new
    res = service.get_products(req)

    res.products
  end

  def self.find(id)
    service = Ec::ProductService::Stub.new(PORT, :this_channel_is_insecure)
    req = Ec::GetByProductIdRequest.new(product_id: id)
    res = service.get_by_product_id(req)

    res.product
  end
end
