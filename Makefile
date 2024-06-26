APP_NAME=$(shell cat .app_name)
BINARY=tmp/$(APP_NAME)
DEBUG=false
TAG=v$(shell cat .version)

.PHONY: default
default: clean

.PHONY: clean
clean:
	@rm -rf dist/ tmp/ \
	node_modules/
	@find . -type d -empty -delete
	@bun install

.PHONY: update
update:
	@go get -u ./...
	@bun update

.PHONY: dev
dev:
	@\
	wgo go mod tidy :: \
	wgo -file .go -file .sql go build -tags=dev -o $(BINARY) ./cmd/$(APP_NAME) :: \
	bash -c "if [ "$(DEBUG)" = "true" ]; then \
		echo "rebuild"; \
	else \
		$(BINARY); \
	fi"

.PHONY: debug
debug:
	@make DEBUG=true dev

.PHONY: snapshot
snapshot:
	@goreleaser release --snapshot --clean

.PHONY: git-tag
tag:
	@git tag -f -a $(TAG) -m "Release $(TAG)"

.PHONY: push-git-tag
git-push-tag:
	@git push origin $(TAG)

