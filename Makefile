.PHONY: app

network:
	docker network create blazemeter-demo || true

app:
	docker build \
	-f Dockerfile.app \
	-t blaze-app . \
	&& docker run \
	-d \
	-p 8888:80 \
	--name=blaze-app \
	--network=blazemeter-demo \
	blaze-app

#TODO add -v mapping to env
bzt:
	docker build \
	-f Dockerfile.taurus \
	-t bzt . \
	&& docker run \
	-v /Users/David/Sites/blazemeter-demo/artifacts:/tmp/artifacts/ \
	--network=blazemeter-demo \
	bzt /bzt-configs/the-test.yml -report

#TODO add -v mapping to env
jenkins:
	docker build \
	-f Dockerfile.jenkins \
	-t jenkins . \
	&& docker run \
	--name=jenkins \
	-p 8080:8080 \
	-v $(PWD)/jenkins_home:/var/jenkins_home \
	-v /Users/David/Sites/blazemeter-demo/artifacts:/var/jenkins_home/artifacts \
	-v /var/run/docker.sock:/var/run/docker.sock \
	--network=blazemeter-demo \
	jenkins

clean:
	docker rm $$(docker stop $$(docker ps -a -q --filter ancestor="blaze-app" --format="{{.ID}}")) || true \
	&& docker ps -a -q | xargs docker rm -v || true
