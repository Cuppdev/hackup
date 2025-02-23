# Hackup.sh - Simulador de Hacker Mode 

HackUp.sh es un script divertido que crea una sesión en `tmux` con múltiples paneles,
simulando comandos de hacking.

⚠️ **Este script no hace ningún hacking real, solo genera texto y efectos visuales.** ⚠️

## 🚀 Características
- Simula logs de kernel y syslog.
- Fake escaneo de puertos con resultados aleatorios.
- Animaciones tipo Matrix con `cmatrix`.
- Fake hacking logs.

## 📥 Instalación
Clona el repositorio y dale permisos de ejecución:

```bash
git clone https://github.com/TU_USUARIO/hackup.git
cd hackup
chmod +x hackup.sh
```

## ▶️ Uso
Ejecuta el script principal:
```bash
./hackup.sh
```
O ejecuta módulos individuales:
```bash
./hackup.sh kernel
./hackup.sh syslog
./hackup.sh scans
./hackup.sh matrix
./hackup.sh superstuff
```
## 🖼️ Vista previa

Así se ve el script en acción:

![HackUp Preview](script.png)
