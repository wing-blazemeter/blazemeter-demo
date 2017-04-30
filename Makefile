include .env

default:
	echo "Hello there!"

bzt:
	docker build \
	-t $(BZT_IMAGE_TAG) . \
	&& docker run \
	-v $(BZT_ARTIFACTS_PATH):/tmp/artifacts/ \
	$(BZT_IMAGE_TAG) \
	$(BZT_COMMAND)
