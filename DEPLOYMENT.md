# 🚀 Guía de Despliegue - Cloud DevOps MiniLab

Esta guía muestra diferentes formas de desplegar la aplicación, cada una usando una herramienta diferente de DevOps.

---

## 📦 Método 1: Docker Compose (Recomendado para Inicio Rápido)

### Descripción
La forma más simple de desplegar la aplicación sin configuraciones adicionales.

### Pasos

```bash
# 1. Construir y ejecutar
docker-compose up -d

# 2. Verificar que está corriendo
docker-compose ps

# 3. Ver los logs
docker-compose logs -f

# 4. Probar la aplicación
curl http://localhost:8000

# 5. Detener
docker-compose down
```

### Ventajas
- ✅ Más simple
- ✅ Todo en un archivo
- ✅ Ideal para desarrollo

### Desventajas
- ❌ No escala bien
- ❌ No es reproducible en múltiples hosts

---

## 🤖 Método 2: Ansible (Automatización)

### Descripción
Despliega la aplicación de forma automatizada y repetible usando Ansible.

### Requisitos
```bash
pip install ansible docker
```

### Pasos

```bash
# 1. Ejecutar playbook
ansible-playbook playbook.yml

# 2. Verificar
curl http://localhost:8000/health

# 3. Ver información
docker ps | grep whitestack

# 4. Detener (manual)
docker stop whitestack_demo
docker rm whitestack_demo
```

### ¿Qué hace Ansible?
1. ✅ Verifica que Docker esté instalado
2. ✅ Construye la imagen Docker
3. ✅ Crea el contenedor con configuración
4. ✅ Configura health checks
5. ✅ Espera a que la app esté lista
6. ✅ Muestra URLs de acceso

### Ventajas
- ✅ Automatización completa
- ✅ Idempotente (puedes ejecutarlo múltiples veces)
- ✅ Verificaciones de salud
- ✅ Ideal para múltiples hosts

### Desventajas
- ❌ Requiere Python y Ansible instalado

---

## ☁️ Método 3: Terraform (Infraestructura como Código)

### Descripción
Gestiona la infraestructura de forma declarativa con Terraform.

### Requisitos
```bash
# Instalar Terraform
# Windows: choco install terraform
# Mac: brew install terraform
# Linux: apt install terraform
```

### Pasos

```bash
# 1. Inicializar Terraform
terraform init

# 2. Ver el plan (qué va a crear)
terraform plan

# 3. Aplicar la infraestructura
terraform apply
# Escribe "yes" cuando pregunte

# 4. Ver información del despliegue
terraform output

# 5. Verificar la aplicación
terraform output application_url
terraform output api_docs_url

# 6. Destruir todo
terraform destroy
```

### ¿Qué crea Terraform?
1. ✅ Red Docker personalizada
2. ✅ Imagen Docker
3. ✅ Contenedor con configuración
4. ✅ Health checks y restart policies
5. ✅ Variables de entorno

### Ventajas
- ✅ Infraestructura como código
- ✅ State management
- ✅ Reproducible en cualquier entorno
- ✅ Versionado de infraestructura
- ✅ Rollback fácil

### Desventajas
- ❌ Requiere aprender HCL
- ❌ Requiere state management

---

## ☸️ Método 4: Kubernetes (Orquestación)

### Opción A: Minikube (Local)

#### Instalación
```bash
# Windows
choco install minikube

# Mac
brew install minikube

# Linux
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

#### Despliegue
```bash
# 1. Iniciar Minikube
minikube start

# 2. Configurar Docker para Minikube
eval $(minikube -p minikube docker-env)

# 3. Construir imagen
docker build -t whitestack-demo:latest .

# 4. Desplegar en Kubernetes
kubectl apply -f kubernetes/

# 5. Ver el estado
kubectl get pods
kubectl get services

# 6. Obtener URL
minikube service whitestack-demo-service --url

# 7. Limpiar
kubectl delete -f kubernetes/
minikube stop
```

### Opción B: Play with Kubernetes (Online, Gratis)

1. Ve a: https://labs.play-with-k8s.com/
2. Crea una sesión
3. Copia los archivos del proyecto
4. Ejecuta:

```bash
# Construir imagen
docker build -t whitestack-demo:latest .

# Desplegar
kubectl apply -f kubernetes/

# Ver pods
kubectl get pods -w

# Exponer servicio
kubectl expose deployment whitestack-demo --type=NodePort
```

### ¿Qué crea Kubernetes?
1. ✅ Deployment con 2 réplicas
2. ✅ Service para acceso
3. ✅ Health checks (liveness y readiness)
4. ✅ Resource limits
5. ✅ Rolling updates automáticos

### Ventajas
- ✅ Escalabilidad horizontal
- ✅ Auto-healing
- ✅ Rolling updates
- ✅ Resource management
- ✅ Alta disponibilidad

### Desventajas
- ❌ Más complejo
- ❌ Requiere aprender Kubernetes
- ❌ Más recursos necesarios

---

## 🧪 Testing Después del Despliegue

### Test Básicos
```bash
# Health check
curl http://localhost:8000/health

# Root endpoint
curl http://localhost:8000/

# Info
curl http://localhost:8000/info

# Ver documentación
open http://localhost:8000/docs
```

### Test Automático
```bash
# Ejecutar tests
python test_app.py

# O con make
make test
```

---

## 📊 Comparación de Métodos

| Método | Complejidad | Escalabilidad | Producción | Aprendizaje |
|--------|-------------|----------------|------------|-------------|
| Docker Compose | ⭐ Baja | ⭐⭐ Media | ❌ No | ✅ Excelente |
| Ansible | ⭐⭐ Media | ⭐⭐⭐ Buena | ⚠️ Posible | ✅✅ Muy Bueno |
| Terraform | ⭐⭐ Media | ⭐⭐⭐⭐ Muy Buena | ✅ Sí | ✅ Bueno |
| Kubernetes | ⭐⭐⭐ Alta | ⭐⭐⭐⭐⭐ Excelente | ✅✅ Sí | ⭐⭐ Complejo |

---

## 🎯 Cuándo Usar Cada Método

### Desarrollo Local
- **Docker Compose** - Rápido y simple

### Pruebas y Staging
- **Ansible** - Automatización y consistencia

### Producción
- **Terraform + Kubernetes** - Escalable y robusto

### Aprendizaje
- **Todos** - Empieza con Compose, luego Ansible, Terraform, y finalmente K8s

---

## 🔧 Troubleshooting por Método

### Docker Compose
```bash
# Ver logs
docker-compose logs -f

# Reconstruir
docker-compose up -d --build

# Limpiar
docker-compose down -v
```

### Ansible
```bash
# Ver modo verboso
ansible-playbook playbook.yml -v

# Ver qué haría sin ejecutar
ansible-playbook playbook.yml --check --diff
```

### Terraform
```bash
# Refrescar state
terraform refresh

# Forzar recrear
terraform apply -replace=docker_container.whitestack_demo

# Ver state actual
terraform show
```

### Kubernetes
```bash
# Ver logs
kubectl logs -f deployment/whitestack-demo

# Describir pod
kubectl describe pod whitestack-demo-xxx

# Ejecutar comando en pod
kubectl exec -it whitestack-demo-xxx -- /bin/bash
```

---

## ✅ Checklist de Despliegue

### Pre-requisitos
- [ ] Docker instalado y corriendo
- [ ] Python 3.11 instalado
- [ ] Git instalado

### Método Ansible
- [ ] Ansible instalado
- [ ] Módulo docker para Ansible

### Método Terraform
- [ ] Terraform instalado
- [ ] Provider Docker configurado

### Método Kubernetes
- [ ] kubectl instalado
- [ ] Minikube o cluster K8s disponible

---

## 🚀 Próximos Pasos

1. **Mejora el proyecto**: Agrega más endpoints, features
2. **CI/CD**: Configura GitHub Actions
3. **Monitoring**: Agrega Prometheus/Grafana
4. **Security**: Implementa security best practices
5. **Production-ready**: Optimiza para producción

---

## 📞 Soporte

Si tienes problemas:
1. Revisa los logs: `docker logs <container>`
2. Verifica los prerequisitos
3. Consulta la documentación oficial
4. Abre un issue en GitHub

---

**¡Feliz despliegue! 🎉**

