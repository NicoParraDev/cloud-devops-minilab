# 🚀 Cloud DevOps MiniLab - Whitestack Practice Project

![Python](https://img.shields.io/badge/Python-3.11-blue)
![FastAPI](https://img.shields.io/badge/FastAPI-0.109-green)
![Docker](https://img.shields.io/badge/Docker-Ready-blue)
![Ansible](https://img.shields.io/badge/Ansible-Automated-red)
![Terraform](https://img.shields.io/badge/Terraform-IaC-purple)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Ready-blue)

---

## 📋 ¿Qué es este Proyecto?

Este es un **proyecto de demostración de infraestructura DevOps** - una aplicación simple que sirve como excusa para mostrar experiencia práctica con el stack completo de tecnologías que busca Whitestack:

- ✅ **Python** + FastAPI (backend development)
- ✅ **Docker** (containerization)
- ✅ **Ansible** (automation)
- ✅ **Terraform** (Infrastructure as Code)
- ✅ **Kubernetes** (orchestration)

### 🎯 **Propósito Principal**

Este proyecto **NO es una aplicación de producción** - es una **demostración práctica de habilidades DevOps** que muestra:
- Desarrollo de API REST con Python/FastAPI
- Containerización con Docker
- Automatización con Ansible
- Infrastructure as Code con Terraform  
- Orquestación con Kubernetes
- CI/CD con GitHub Actions

**Es un portfolio técnico funcional** para demostrar experiencia en todas las tecnologías que buscan en puestos de Cloud DevOps Engineering.

---

## 🏗️ Arquitectura del Proyecto

![CLOUD DEVOPS MINILAB](https://github.com/user-attachments/assets/5e3f0cd6-7a22-4c5e-9721-b9ae20e12e0d)



---

## 📋 Descripción Detallada

Este mini-laboratorio demuestra cómo construir, containerizar, automatizar y desplegar una aplicación Python con las herramientas DevOps más utilizadas en la industria cloud.

### ✅ Tecnologías Incluidas

- **Python 3.11** + FastAPI - Desarrollo de aplicaciones backend
- **Docker** - Containerización
- **Docker Compose** - Orquestación de contenedores
- **Ansible** - Automatización y configuración
- **Terraform** - Infraestructura como código (IaC)
- **Kubernetes** - Orquestación de contenedores a escala

### 🎯 Requisitos de Whitestack Cubiertos

✅ Dominio de Linux (administrador)  
✅ Automatización con Ansible  
✅ Containerización con Docker  
✅ Desarrollo en Python  
✅ Shell scripting (Bash)  
✅ Infraestructura con Terraform  
✅ Kubernetes (opcional pero incluido)  
✅ Networking básico  

---

## 🏗️ Arquitectura del Proyecto

```
Cloud_DevOps_MiniLab/
├── main.py                 # Aplicación FastAPI (3 endpoints simples)
├── requirements.txt        # Dependencias Python
├── Dockerfile              # Imagen Docker
├── docker-compose.yml      # Orquestación Docker
├── playbook.yml            # Automatización Ansible
├── ansible.cfg             # Configuración Ansible
├── main.tf                 # Configuración Terraform
├── versions.tf             # Versiones Terraform
├── kubernetes/             # Manifests Kubernetes
│   ├── deployment.yaml
│   ├── service.yaml
│   └── kustomization.yaml
├── Makefile               # Comandos automatizados
├── .gitignore
└── README.md               # Esta guía
```

---

## ⚠️ IMPORTANTE: ¿Qué es Este Proyecto?

### ✅ ES:

- **Una demostración de infraestructura DevOps**
- Un proyecto educativo para aprender y practicar
- Un portfolio técnico para mostrar habilidades
- Un ejemplo de best practices en DevOps
- Un caso de uso real de integración de tecnologías

### ❌ NO ES:

- Una aplicación de producción
- Un servicio web complejo
- Una solución para usuarios finales
- Un negocio o startup
- Un producto comercial

### 🎯 **El Valor Está en el Stack DevOps, No en la Aplicación**

La aplicación Python es **intencionalmente simple** (3 endpoints) porque el **objetivo NO es la aplicación, sino demostrar**:

1. ✅ **Containerización**: Cómo dockerizar correctamente
2. ✅ **Automatización**: Cómo usar Ansible para deploy
3. ✅ **IaC**: Cómo usar Terraform para infraestructura
4. ✅ **Orquestación**: Cómo usar Kubernetes
5. ✅ **CI/CD**: Cómo automatizar con GitHub Actions
6. ✅ **Best Practices**: Health checks, logging, etc.

**La aplicación es el medio, el fin es demostrar experiencia en DevOps** 🎯

---

## 🚀 Guía de Uso

### Opción 1: Docker Compose (Más Simple) ⭐

La forma más fácil de empezar:

```bash
# Construir y ejecutar
docker-compose up -d

# Ver logs
docker-compose logs -f

# Verificar el despliegue
curl http://localhost:8001

# Detener
docker-compose down
```

**Acceso a la aplicación:**
- API: http://localhost:8001
- Health Check: http://localhost:8001/health
- Documentación: http://localhost:8001/docs

---

### Opción 2: Automatización con Ansible 🤖

Despliega de forma automatizada con Ansible:

```bash
# Ejecutar playbook
ansible-playbook playbook.yml

# O con make
make deploy-ansible
```

**¿Qué hace Ansible?**
- ✅ Verifica que Docker esté instalado
- ✅ Construye la imagen Docker
- ✅ Crea y inicia el contenedor
- ✅ Configura health checks
- ✅ Espera a que la app esté lista
- ✅ Muestra la URL de acceso

---

### Opción 3: Infraestructura como Código con Terraform ☁️

Despliega con Terraform (IaC):

```bash
# Inicializar Terraform
terraform init

# Ver el plan de ejecución
terraform plan

# Aplicar la infraestructura
terraform apply

# Ver outputs (URLs importantes)
terraform output

# Destruir cuando termines
terraform destroy
```

**O usar Make:**

```bash
make deploy-terraform
make info
```

**¿Qué crea Terraform?**
- ✅ Red Docker personalizada
- ✅ Contenedor con configuración
- ✅ Health checks y restart policies
- ✅ Variables de entorno

---

### Opción 4: Kubernetes ☸️ (Opcional)

#### Con Minikube (Local)

```bash
# Iniciar Minikube
minikube start

# Construir imagen en el contexto de Minikube
eval $(minikube -p minikube docker-env)
docker build -t whitestack-demo:latest .

# Desplegar
kubectl apply -f kubernetes/

# Ver el estado
kubectl get pods
kubectl get services

# Obtener la URL
minikube service whitestack-demo-service --url
```

#### Con Play with Kubernetes (Online - Gratis)

1. Ve a: https://labs.play-with-k8s.com/
2. Copia los archivos de la carpeta `kubernetes/`
3. Ejecuta: `kubectl apply -f .`

---

## 🧪 Testing

### Probar Endpoints

```bash
# Root endpoint
curl http://localhost:8001

# Health check
curl http://localhost:8001/health

# Info
curl http://localhost:8001/info
```

### Ver Logs

```bash
# Docker Compose
docker-compose logs -f

# Docker directo
docker logs whitestack_demo -f

# Kubernetes
kubectl logs -f deployment/whitestack-demo
```

---

## 📚 Aprendizaje por Etapas

### Etapa 1: Python + FastAPI (30 min)
- [ ] Crear aplicación básica
- [ ] Agregar endpoints
- [ ] Entender async/await
- [ ] Documentación automática

### Etapa 2: Docker (1 hora)
- [ ] Entender Dockerfile
- [ ] Build de imagen
- [ ] Ejecutar contenedor
- [ ] Volúmenes y puertos

### Etapa 3: Ansible (2 horas)
- [ ] Entender YAML syntax
- [ ] Crear playbooks
- [ ] Idempotencia
- [ ] Inventarios

### Etapa 4: Terraform (2 horas)
- [ ] Infraestructura como código
- [ ] Providers y recursos
- [ ] Variables y outputs
- [ ] State management

### Etapa 5: Kubernetes (3+ horas)
- [ ] Pods, Deployments, Services
- [ ] ConfigMaps y Secrets
- [ ] Rolling updates
- [ ] Health checks

---

## 🎓 Conceptos Clave para Whitestack

### Python Development

```python
# FastAPI es moderno y rápido
from fastapi import FastAPI

app = FastAPI()

@app.get("/")  # Decoradores para rutas
async def hello():  # Async support
    return {"status": "ok"}
```

**Para Whitestack necesitas:**
- Experiencia con Python 3+ ✅
- Conocimiento de asyncio ✅
- Estructura de proyectos ✅

### Docker & Containerization

```dockerfile
FROM python:3.11-slim  # Multi-stage builds
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt  # Caching layers
CMD ["uvicorn", "main:app"]
```

**Para Whitestack necesitas:**
- Crear imágenes eficientes ✅
- Multi-stage builds ✅
- Health checks ✅

### Ansible Automation

```yaml
- name: Deploy container
  docker_container:
    name: myapp
    image: myapp:latest
    state: started
```

**Para Whitestack necesitas:**
- Playbooks para despliegues ✅
- Idempotencia ✅
- Integración con múltiples sistemas ✅

### Terraform IaC

```hcl
resource "docker_container" "app" {
  image = "myapp:latest"
  name  = "myapp"
}
```

**Para Whitestack necesitas:**
- Infraestructura declarativa ✅
- State management ✅
- Variables y módulos ✅

---

## 🛠️ Comandos Rápidos (Make)

```bash
make help              # Ver todos los comandos
make build             # Build Docker image
make run               # Iniciar con docker-compose
make stop              # Detener contenedores
make clean             # Limpiar todo
make deploy-ansible    # Desplegar con Ansible
make deploy-terraform  # Desplegar con Terraform
make test              # Probar endpoints
make info              # Ver información del despliegue
```

---

## 📖 Documentación de la API

Una vez que el proyecto esté corriendo, accede a:

- **Swagger UI**: http://localhost:8001/docs
- **ReDoc**: http://localhost:8001/redoc
- **OpenAPI JSON**: http://localhost:8001/openapi.json

---

## 🐛 Troubleshooting

### Error: Docker no está corriendo

```bash
# Linux
sudo systemctl start docker

# Windows/Mac
# Abrir Docker Desktop
```

### Error: Puerto 8001 ocupado

```bash
# Cambiar el puerto en docker-compose.yml o main.tf
ports:
  - "8002:8000"  # Usar 8002 en lugar de 8001
```

### Error: Ansible no encuentra módulo docker

```bash
pip install ansible
pip install docker
pip install community.docker
```

### Error: Terraform no inicializado

```bash
terraform init
```

---

## 🎯 Próximos Pasos

### Para el CV y Portfolio

1. ✅ **GitHub**: Ya subiste este proyecto
2. ✅ **CI/CD**: Agregue GitHub Actions
3. ⏳ **Monitoring**: Integra Prometheus/Grafana
4. ⏳ **Documentación**: Ya tienes README completo
5. ⏳ **Tests**: Ya tienes test_app.py

### Recomendaciones Específicas para Whitestack

1. **Practica Linux**:
   ```bash
   # Trabaja con WSL2 o Linux nativo
   # Aprende comandos avanzados
   ```

2. **Entiende Networking**:
   ```bash
   # Experimenta con firewalls
   # Configura VLANS virtuales
   # Aprende iptables/nftables
   ```

3. **OpenStack y Ceph**:
   ```bash
   # Instala DevStack (gratis)
   # Lee documentación de Ceph
   ```

4. **Kubernetes Avanzado**:
   ```bash
   # Aprende Helm
   # Entiende Service Mesh
   # Practica con Operators
   ```

---

## 🌟 Recursos Gratuitos para Aprender

- **Kubernetes**: [https://kubernetes.io/training/](https://kubernetes.io/training/)
- **Terraform**: [https://learn.hashicorp.com/terraform](https://learn.hashicorp.com/terraform)
- **Ansible**: [https://docs.ansible.com/ansible/latest/user_guide/](https://docs.ansible.com/ansible/latest/user_guide/)
- **Docker**: [https://docs.docker.com/get-started/](https://docs.docker.com/get-started/)
- **FastAPI**: [https://fastapi.tiangolo.com/](https://fastapi.tiangolo.com/)

---

## 📝 Estructura del Código

### main.py - Aplicación Principal
- FastAPI app con 3 endpoints
- Async/await support
- Documentation automática

### Dockerfile - Containerización
- Multi-stage build
- Health checks
- Optimizado para producción

### playbook.yml - Automatización
- Tasks idempotentes
- Health checks
- Error handling

### main.tf - Infraestructura
- Resource definitions
- Outputs
- Reusable modules

### Kubernetes/ - Orquestación
- Deployment con replicas
- Service con NodePort
- Health checks y resource limits

---

## 🤝 Contribuciones

Este es un proyecto de práctica. Siéntete libre de:
- Agregar más endpoints
- Mejorar la configuración
- Agregar tests
- Crear nuevas features

---

## 📄 Licencia

Este proyecto está bajo la licencia MIT - siéntete libre de usarlo para aprender y practicar.

---

## 💪 ¡Éxito con tu Aplicación a Whitestack!

Este proyecto te da experiencia práctica con:
- ✅ Python development
- ✅ Docker y containerización
- ✅ Ansible automation
- ✅ Terraform IaC
- ✅ Kubernetes (opcional)

**Todo 100% gratis y sin necesidad de pagar servicios en la nube.**

---

### 📧 Contacto

Si tienes preguntas sobre el proyecto o quieres mejorar algo, abre un issue en GitHub o contribuye con un PR.

---

**¿Listo para desplegar? ¡Empecemos! 🚀**

```bash
make deploy-ansible  # O cualquier otro método
```
