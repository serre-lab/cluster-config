REPO := "bnavetta/tensorflow-example"
TAG := $(shell ./docker-tag.sh)
IMAGE := "$(REPO):$(TAG)"

.PHONY: all image push clean deploy undeploy

all: image

image:
	docker build -t $(IMAGE) .

push: image
	docker push $(IMAGE)

clean:
	docker rmi $(IMAGE)

deploy:
	kubectl apply -f job.yaml

undeploy:
	kubectl delete job tf-example