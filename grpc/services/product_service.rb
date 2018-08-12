module Grpc
  class ProductService < Ec::ProductService::Service
    def get_products(req, _call)
      products = Product.all
      Ec::GetProductsResponse.new(products: products.map(&:to_proto))
    end

    def get_by_product_id(req, _call)
      product = Product.find_by(id: req.product_id)
      if product.present?
        Ec::GetByProductIdResponse.new(product: product.to_proto)
      else
        fail GRPC::BadStatus.new_status_exception(
          GRPC::Core::StatusCodes::ABORTED,
          "product #{req.product_id} not found"
        )
      end
    end
  end
end
