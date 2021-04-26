IMAGE_NAME=centos7-python-django
REGISTRY=registry.gz.cvte.cn/infra
TAG=latest

image:
	docker build -t $(IMAGE_NAME) --no-cache .

push:
	docker tag $(IMAGE_NAME) $(REGISTRY)/$(IMAGE_NAME):TAG
	docker push $(REGISTRY)/$(IMAGE_NAME):TAG
