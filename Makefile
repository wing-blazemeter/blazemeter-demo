include .env

.PHONY: app

default:
	echo "Hello there!"

bzt:
	docker build \
	-f Dockerfile.taurus \
	-t $(BZT_IMAGE_TAG) . \
	&& docker run \
	-v $(BZT_ARTIFACTS_PATH):/tmp/artifacts/ \
	$(BZT_IMAGE_TAG) \
	$(BZT_COMMAND)

app:
	docker build \
	-f Dockerfile.app \
	-t $(APP_IMAGE_TAG) . \
	&& docker run \
	-p 8888:80 \
	$(APP_IMAGE_TAG)
