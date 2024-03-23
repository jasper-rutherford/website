include .env

start:
	@docker run -d -p 3000:3000 -v $(PWD):/app -w /app node:20 node app.js
	@echo "Node.js server started."

stop:
	@docker ps -q --filter ancestor=node:20 | xargs -r docker stop
	@echo "Node.js server stopped."

ssh:
	sudo ssh -i ${KEY} ec2-user@${IP}
