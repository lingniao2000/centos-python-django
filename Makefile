IMAGE_NAME=centos8-python-django
REGISTRY=registry.gz.cvte.cn/infra
TAG=latest

image:
	docker build -t $(IMAGE_NAME) --no-cache .

scan:
	docker scan $(IMAGE_NAME):$(TAG)

push:
	#docker rmi $(REGISTRY)/$(IMAGE_NAME):$(TAG)
	docker tag $(IMAGE_NAME) $(REGISTRY)/$(IMAGE_NAME):$(TAG)
	docker push $(REGISTRY)/$(IMAGE_NAME):$(TAG)

make:
	make image && make push