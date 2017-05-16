include .env

.PHONY: app

default:
	echo "Hello there!"

network:
	docker network create blazemeter-demo

app:
	docker build \
	-f Dockerfile.app \
	-t $(APP_IMAGE_TAG) . \
	&& docker run \
	-p 8888:80 \
	--name=blaze-app \
	--network=blazemeter-demo \
	$(APP_IMAGE_TAG)

bzt:
	docker build \
	-f Dockerfile.taurus \
	-t $(BZT_IMAGE_TAG) . \
	&& docker run \
	-v $(BZT_ARTIFACTS_PATH):/tmp/artifacts/ \
	--network=blazemeter-demo \
	$(BZT_IMAGE_TAG) \
	$(BZT_COMMAND) -report

jenkins:
	docker run \
	--name=jenkins-blue-ocean \
	--rm \
	--publish 8080:8080 \
	--volume $(PWD)/jenkins_home:/var/jenkins_home \
	--network=blazemeter-demo \
	jenkinsci/blueocean:1.0.1
