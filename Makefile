# Copyright SecureKey Technologies Inc.
#
# SPDX-License-Identifier: Apache-2.0

GO_CMD ?= go
STRAPI_DEMO_PATH=cmd/strapi-demo

.PHONY: all
all: checks unit-test

.PHONY: checks
checks: license lint

.PHONY: lint
lint:
	@scripts/check_lint.sh

.PHONY: license
license:
	@scripts/check_license.sh

unit-test:
	@scripts/check_unit.sh

strapi-build:
	@echo "Building strapi demo"
	@mkdir -p ./build/bin
	@cd ${STRAPI_DEMO_PATH} && go build -o ../../build/bin/strapi-demo main.go

strapi-start:
	@scripts/strapi-start.sh

strapi-stop:
	@scripts/strapi-stop.sh

strapi-setup:
	@scripts/strapi-setup.sh
