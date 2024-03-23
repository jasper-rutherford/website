include .env

start:
	@docker run -d -p 3000:3000 -v $(PWD):/app -w /app node:20 node app.js
	@echo "Node.js server started."

stop:
	@docker ps -q --filter ancestor=node:20 | xargs -r docker stop
	@echo "Node.js server stopped."

ssh:
	sudo ssh -i ${KEY} ec2-user@${IP}

# Makefile

# Variables
IMAGE_NAME := my-node-app
CONTAINER_NAME := my-node-container

# Targets
docker-build:
	docker build -t $(IMAGE_NAME) .

docker-run:
	if docker ps -a --format '{{.Names}}' | grep -Eq '^$(CONTAINER_NAME)$$'; then \
		make docker-stop; \
	fi
	docker run -d --name $(CONTAINER_NAME) -p 3000:3000 $(IMAGE_NAME)
	@echo "Node.js server started."

docker-start: docker-build docker-run

docker-stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)
	@echo "Node.js server stopped."
