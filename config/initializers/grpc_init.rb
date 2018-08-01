# TODO: Auto-reload
Rails.application.config.to_prepare do
  module Grpc
  end

  if defined? Ec
    Google::Protobuf::DescriptorPool.generated_pool.clear()

    Ec.class_eval do
      remove_const(:GetProductsRequest)
      remove_const(:GetProductsResponse)
      remove_const(:GetByProductIdRequest)
      remove_const(:GetByProductIdResponse)
      remove_const(:Product)
      remove_const(:Tag)
      remove_const(:ProductService)
    end
  end

  grpc_libs = "#{Rails.root}/proto/lib/"
  $LOAD_PATH.unshift(grpc_libs)

  # Dir.glob(grpc_libs + '**/*.rb').each { |f| require f }
  load grpc_libs + "ec_pb.rb"
  load grpc_libs + "ec_services_pb.rb"

  # grpc_services = "#{Rails.root}/app/grpc/**/*.rb"
  # Dir.glob(grpc_services).each { |f| require f }
  #
  # # TODO: fix dir
  # grpc_extends = "#{Rails.root}/app/models/ec/*.rb"
  # Dir.glob(grpc_extends).each { |f| require f; puts f }
 end
