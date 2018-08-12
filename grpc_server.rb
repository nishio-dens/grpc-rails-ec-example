# Todo:
#   - Graceful Restart
#   - Auto Reload

@server = RailsGrpc::GeneralServer.new(port: "127.0.0.1:8080", pool_size: 3)
@server.set_handlers([
  Grpc::ProductService
])
@server.run
