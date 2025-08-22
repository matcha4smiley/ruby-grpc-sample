$LOAD_PATH.unshift(File.expand_path("lib/helloworld", __dir__))

require "grpc"
require_relative "lib/helloworld/hello_services_pb"

stub = Helloworld::Greeter::Stub.new("localhost:50051", :this_channel_is_insecure)
name = ARGV[0] || "World"
puts stub.say_hello(Helloworld::HelloRequest.new(name: name)).message