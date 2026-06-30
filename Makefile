export PROJECT_ROOT=${shell pwd}
export PROTO_ROOT=${PROJECT_ROOT}/proto
export GEN_ROOT=${PROJECT_ROOT}/gen

protoc-go-gen:
	@if [ -z "${path}" ]; then \
		echo "pls, try again with path=value, example: path=sso/sso.proto"; \
		exit 1; \
	fi; \
	protoc -I ${PROTO_ROOT} ${path} \
	--go_out=${GEN_ROOT}/go --go_opt=paths=source_relative \
	--go-grpc_out=${GEN_ROOT}/go --go-grpc_opt=paths=source_relative

	