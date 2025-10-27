.PHONY: help build run stop clean deploy-ansible deploy-terraform test

help: ## Show this help message
	@echo "Cloud DevOps MiniLab - Available commands:"
	@echo ""
	@echo "Docker Commands:"
	@echo "  make build          - Build Docker image"
	@echo "  make run            - Run container with docker-compose"
	@echo "  make stop           - Stop containers"
	@echo "  make clean          - Remove containers and images"
	@echo ""
	@echo "Deployment Commands:"
	@echo "  make deploy-ansible  - Deploy with Ansible"
	@echo "  make deploy-terraform - Deploy with Terraform"
	@echo ""
	@echo "Testing:"
	@echo "  make test           - Run tests"

build: ## Build Docker image
	docker build -t whitestack-demo:latest .

run: ## Run with docker-compose
	docker-compose up -d

stop: ## Stop containers
	docker-compose down

clean: ## Clean up containers and images
	docker-compose down -v
	docker rmi whitestack-demo:latest || true

deploy-ansible: ## Deploy with Ansible
	ansible-playbook playbook.yml

deploy-terraform: ## Deploy with Terraform
	terraform init
	terraform plan
	terraform apply -auto-approve

terraform-destroy: ## Destroy Terraform infrastructure
	terraform destroy -auto-approve

test: ## Test the application
	@echo "Testing application endpoints..."
	@curl -s http://localhost:8000/ | cat
	@curl -s http://localhost:8000/health | cat

info: ## Show deployment information
	@echo "=== Deployment Information ==="
	@echo "Application URL: http://localhost:8000"
	@echo "Health Check: http://localhost:8000/health"
	@echo "API Docs: http://localhost:8000/docs"
	@docker ps --filter "name=whitestack_demo" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

