protoc:
	 protoc -I ./proto/ --ruby_out=./proto/lib --grpc_out=./proto/lib --plugin=protoc-gen-grpc=`which grpc_ruby_plugin` ./proto/ec.proto
