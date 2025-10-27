terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Create a Docker network
resource "docker_network" "demo_network" {
  name   = "whitestack_demo_network"
  driver = "bridge"
}

# Create the Docker container
resource "docker_container" "whitestack_demo" {
  name  = "whitestack_demo"
  image = docker_image.whitestack_demo.image_id

  ports {
    internal = 8000
    external = 8001
  }

  networks_advanced {
    name = docker_network.demo_network.name
  }

  env = [
    "ENV=production",
    "HOSTNAME=whitestack_demo"
  ]

  restart = "unless-stopped"

  healthcheck {
    test     = ["CMD", "curl", "-f", "http://localhost:8000/health"]
    interval = "30s"
    timeout  = "3s"
    retries  = 3
    start_period = "40s"
  }
}

# Reference to the Docker image
resource "docker_image" "whitestack_demo" {
  name = "whitestack-demo:latest"
  
  build {
    context    = "."
    dockerfile = "Dockerfile"
  }
}

# Outputs
output "container_name" {
  description = "Name of the container"
  value       = docker_container.whitestack_demo.name
}

output "container_id" {
  description = "ID of the container"
  value       = docker_container.whitestack_demo.id
}

output "application_url" {
  description = "URL to access the application"
  value       = "http://localhost:8001"
}

output "health_check_url" {
  description = "URL for health check"
  value       = "http://localhost:8001/health"
}

output "api_docs_url" {
  description = "URL for API documentation"
  value       = "http://localhost:8001/docs"
}
