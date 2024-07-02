APP_NAME=template-go
BINARY=tmp/$(APP_NAME)
DEBUG=false

.PHONY: default
default: clean install-tools build

.PHONY: clean
clean:
	@rm -rf dist/ tmp/ node_modules/

.PHONY: download
download:
	@go mod tidy
	@go mod download

.PHONY: install-tools
install-tools: download
	@cat tools.go | grep _ | awk -F'"' '{print $$2}' | xargs -tI % go install %
	@lefthook install
	@bun install

.PHONY: update
update:
	@go get -u ./...

.PHONY: build
build:
	@go build -tags='dev' -o $(BINARY) ./cmd/$(APP_NAME)

.PHONY: run
run:
	@\
	bash -c "if [ "$(DEBUG)" = "true" ]; then \
		echo "rebuild"; \
	else \
		$(BINARY); \
	fi"

.PHONY: dev
dev:
	@\
	wgo -file .go go mod tidy :: \
	wgo -file .go make -s build :: \
	wgo -file $(BINARY) make -s run

.PHONY: debug
debug:
	@make DEBUG=true dev

.PHONY: snapshot
snapshot:
	@goreleaser release --snapshot --clean

TAG=v$(shell cat .version)

.PHONY: git-tag
git-tag:
	@git tag -f -a $(TAG) -m "Release $(TAG)"
	@git push origin $(TAG)

.PHONY: push-tag
push-tag:
	@git push origin $(TAG)