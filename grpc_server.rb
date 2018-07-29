# Todo:
#   - Graceful Restart
#   - Auto Reload
class GrpcServer
  PORT = '127.0.0.1:8080'
  POOL_SIZE = 3

  def initialize
    @server = GRPC::RpcServer.new(pool_size: POOL_SIZE)
    @server.add_http2_port(PORT, :this_port_is_insecure)
  end

  def set_handler(handler)
    @server.handle(handler)
  end

  def run
    puts "Starting to listen: #{PORT}"
    @server.run
  end
end

server = GrpcServer.new
server.set_handler(Grpc::ProductService)

server.run
