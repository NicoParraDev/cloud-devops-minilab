# Script para subir el proyecto a GitHub
# Ejecuta: .\upload-to-github.ps1

Write-Host "🚀 Subiendo Cloud DevOps MiniLab a GitHub" -ForegroundColor Green
Write-Host ""

# Verificar si ya hay un repositorio git
if (Test-Path .git) {
    Write-Host "⚠️  Ya existe un repositorio git" -ForegroundColor Yellow
    $continue = Read-Host "¿Continuar de todas formas? (y/n)"
    if ($continue -ne "y") {
        exit
    }
}

# Verificar si git está instalado
try {
    git --version | Out-Null
    Write-Host "✅ Git instalado" -ForegroundColor Green
} catch {
    Write-Host "❌ Git no está instalado. Descarga Git desde: https://git-scm.com/downloads" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Paso 1: Inicializando repositorio Git..." -ForegroundColor Yellow
git init

Write-Host ""
Write-Host "Paso 2: Agregando archivos..." -ForegroundColor Yellow
git add .

Write-Host ""
Write-Host "Paso 3: Creando commit inicial..." -ForegroundColor Yellow
git commit -m "Initial commit: Cloud DevOps MiniLab

- FastAPI application with Python
- Docker containerization  
- Ansible automation
- Terraform IaC
- Kubernetes manifests
- Complete documentation
- For Whitestack DevOps position practice"

Write-Host ""
Write-Host "✅ Commit creado exitosamente!" -ForegroundColor Green
Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "📝 SIGUIENTE PASO: Crear repo en GitHub" -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Ve a: https://github.com/new" -ForegroundColor White
Write-Host "2. Nombre del repo: cloud-devops-minilab" -ForegroundColor White
Write-Host "3. Descripción: Cloud DevOps MiniLab - Python, Docker, Ansible, Terraform, Kubernetes"
Write-Host "4. NO marques 'Add README'" -ForegroundColor White
Write-Host "5. Click 'Create repository'" -ForegroundColor White
Write-Host ""
Write-Host "Luego ejecuta estos comandos (cambia TU_USERNAME):" -ForegroundColor Yellow
Write-Host ""
Write-Host 'git remote add origin https://github.com/TU_USERNAME/cloud-devops-minilab.git' -ForegroundColor Cyan
Write-Host 'git branch -M main' -ForegroundColor Cyan
Write-Host 'git push -u origin main' -ForegroundColor Cyan
Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "💡 O ejecuta manualmente:" -ForegroundColor Yellow
Write-Host 'git remote add origin https://github.com/TU_USERNAME/cloud-devops-minilab.git' -ForegroundColor White
Write-Host 'git branch -M main' -ForegroundColor White  
Write-Host 'git push -u origin main' -ForegroundColor White
Write-Host ""

