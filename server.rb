$LOAD_PATH.unshift(File.expand_path("lib/helloworld", __dir__))

require "grpc"
require_relative "lib/helloworld/hello_services_pb"

class GreeterServer < Helloworld::Greeter::Service
  def say_hello(req, _call)
    Helloworld::HelloReply.new(message: "Hello, #{req.name}")
  end
end

s = GRPC::RpcServer.new
s.add_http2_port("127.0.0.1:50051", :this_port_is_insecure)
s.handle(GreeterServer)
puts "[server] listening on 127.0.0.1:50051"
s.run_till_terminated