# You can use this file to build a container locally
build:
	docker build -t ${USER}/thelounge .

.PHONY: build
