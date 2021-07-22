IMAGE_NAME=centos8-python-django
REGISTRY=xxx.xxx.xxx
TAG=latest

image:
	docker build -t $(IMAGE_NAME) --no-cache .

scan:
	docker scan $(IMAGE_NAME):$(TAG)

push:
	docker tag $(IMAGE_NAME) $(REGISTRY)/$(IMAGE_NAME):$(TAG)
	docker push $(REGISTRY)/$(IMAGE_NAME):$(TAG)

make:
	make image && make push

clean:
	docker rmi $(REGISTRY)/$(IMAGE_NAME):$(TAG)
	docker rmi $(IMAGE_NAME):$(TAG)
