# TODO: Auto-reload
module Grpc
end

grpc_libs = "#{Rails.root}/proto/lib/"
$LOAD_PATH.unshift(grpc_libs)

Dir.glob(grpc_libs + '**/*.rb').each { |f| require f }

grpc_services = "#{Rails.root}/app/grpc/**/*.rb"
Dir.glob(grpc_services).each { |f| require f }

# TODO: fix dir
grpc_extends = "#{Rails.root}/app/models/ec/*.rb"
Dir.glob(grpc_extends).each { |f| require f; puts f }
