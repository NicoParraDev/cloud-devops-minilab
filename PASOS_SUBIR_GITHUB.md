# 📝 Pasos para Subir el Proyecto a GitHub

## ✅ PASO 1: Llenar el Formulario en GitHub

En la página donde estás ahora (https://github.com/new), completa:

### 1️⃣ Repository name
```
cloud-devops-minilab
```

### 2️⃣ Description
```
Cloud DevOps MiniLab - Python, Docker, Ansible, Terraform, Kubernetes practice project for Whitestack
```

### 3️⃣ Visibility
- **Público** (para que lo vean en tu CV)

### 4️⃣ Add a README file
- **OFF** (desactiva esto) ❌

### 5️⃣ Add .gitignore
- **None** o **OFF** (tu proyecto ya tiene .gitignore)

### 6️⃣ Choose a license
- **MIT License** (opcional pero recomendado)

---

## ✅ PASO 2: Crear el Repositorio

Haz clic en el botón verde: **"Create repository"**

Después de crear el repositorio, GitHub te mostrará una página con instrucciones.

---

## ✅ PASO 3: Copiar la URL del Repositorio

En la página que aparece después de crear el repo, verás algo como:

```
https://github.com/TU_USERNAME/cloud-devops-minilab.git
```

**Copia esa URL completa** 📋

---

## ✅ PASO 4: Ejecutar Comandos en PowerShell

Abre PowerShell en la carpeta del proyecto y ejecuta:

```powershell
# 1. Inicializar git (solo la primera vez)
git init

# 2. Agregar todos los archivos
git add .

# 3. Crear el commit
git commit -m "Initial commit: Cloud DevOps MiniLab
- FastAPI application
- Docker containerization
- Ansible automation
- Terraform IaC
- Kubernetes manifests"

# 4. Conectar con GitHub (pega la URL que copiaste)
git remote add origin https://github.com/TU_USERNAME/cloud-devops-minilab.git

# 5. Cambiar rama a main
git branch -M main

# 6. Subir el código
git push -u origin main
```

---

## ✅ PASO 5: ¡Verificar!

Ve a: `https://github.com/TU_USERNAME/cloud-devops-minilab`

Deberías ver todos tus archivos ✅

---

## 🎯 Resumen Visual

```
┌────────────────────────────────────────┐
│   1️⃣  Llenar formulario en GitHub    │
│   2️⃣  Crear repositorio               │
│   3️⃣  Copiar URL del repositorio      │
│   4️⃣  Ejecutar comandos git          │
│   5️⃣  ¡Listo! 🎉                      │
└────────────────────────────────────────┘
```

---

## 💡 Tips

- Si GitHub te pide autenticación, usa un **Personal Access Token**
- Si no tienes Git instalado, descarga: https://git-scm.com/downloads
- Si tienes errores, mándame la foto y te ayudo

---

## ❓ ¿Necesitas Ayuda?

Si te encuentras con algún error, dime:
1. ¿Qué comando ejecutaste?
2. ¿Qué error apareció?

---

**¡Una vez creado el repositorio en GitHub, ejecuta los comandos!** 🚀

