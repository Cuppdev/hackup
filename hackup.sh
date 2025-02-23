
RESET="\033[0m"
BOLD="\033[1m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"


KERNEL_LOGS=(
  "PCI: Enabling device (0000 -> 0003)"
  "cupdev kernel: device eth0 entered promiscuous mode"
  "kernel BUG at fs/inode.c:342!"
  "rabia-dulce kernel: critical temperature reached on CPU"
  "hackeando-jordan kernel: usb 1-1: New USB device found"
  "SMP: CPU0: USER, CPU1 online, CPU2 online, HPC daemon loaded"
  "IPv6: ADDRCONF(NETDEV_UP): enp3s0: link is not ready"
  "EXT4-fs (sda3): mounted filesystem with ordered data mode"
  "Netfilter messages via NETLINK v0.30. Hack the Planet!"
  "Overclocking CPU for USER…"
  "Warning: CPU frequency scaling beyond recommended specs"
  "Thermal throttle engaged! Reducing temperature for USER's system"
)

SYSLOGS=(
  "sudo:  USER : TTY=pts/2 ; PWD=/home/USER ; USER=root ; COMMAND=/bin/nmap 82.123.5.1"
  "cup systemd[1]: Starting LSB: System V style init script"
  "rabia-dulce CRON[1234]: (root) CMD (/usr/local/bin/backup.sh)"
  "hackeando-jordan sshd[394]: Did not receive identification string from 112.45.67.89"
  "USER polkitd(authority=local): Registered Authentication Agent"
  "systemd-udevd[1009]: link_config: autonegotiation is unset or enabled."
  "USER ha iniciado sesión con privilegios totales."
  "Malware detectado en /home/USER/tmp"
  "USER reiniciando servicios críticos..."
  "Firewall detecta conexión sospechosa para USER"
)

SCAN_TARGETS=(
  "82.123.1.21"
  "198.51.100.45"
  "93.184.216.34"
  "cup-rabia.dulce"
  "8.8.8.8"
  "192.168.1.46"
  "hackeando-jordan.dev"
  "hacktheplanet.org"
  "github.com/USER"
  "very-secret-server-of-USER"
  "top-secret-db.USER.lab"
  "secret-node-for-USER.cluster"
)

SUPER_STUFF=(
  "Iniciando infiltración en host remoto de USER..."
  "Crackeando WPA2... [56%]"
  "AES-256 Decryption en progreso..."
  "Generando clave PGP de 8192 bits para USER..."
  "Troyano activado en 192.168.56.101"
  "Comando C2: Exfiltrando datos del objetivo de USER"
  "SQL injection exitosa en hacktheplanet.org"
  "Realizando ingeniería inversa a binario ELF de USER..."
  "Compilando exploit local root... [80%]"
  "¡Backdoor establecida para USER!"
  "USER se ha saltado la protección UEFI Secure Boot"
  "Minando criptomonedas en un servidor de la NASA para USER..."
  "Desplegando payload multi-stage en la infraestructura de USER..."
  "Analizando paquetes en tiempo real para USER..."
)


function type_text() {
  local text="$1"
  local delay_min=0.01
  local delay_max=0.04
  for (( i=0; i<${#text}; i++ )); do
    echo -n "${text:$i:1}"

    awk -v min="$delay_min" -v max="$delay_max" 'BEGIN {
      delay = min + rand() * (max - min);
      system("sleep " delay);
    }'
  done
  echo
}


function show_banner() {
  echo -e "${GREEN}${BOLD}"
  if command -v figlet &>/dev/null; then
    figlet -c Cupsole
  else
    
    cat << 'EOF'
   ______                __                __
  / ____/___  _________ / /___ _____  ____/ /
 / /   / __ \/ ___/ __ `/ / __ `/ __ \/ __  / 
/ /___/ /_/ / /  / /_/ / / /_/ / / / / /_/ /  
\____/\____/_/   \__,_/_/\__,_/_/ /_/\__,_/   
EOF
  fi
  echo -e "${RESET}"
}


function run_kernel() {
  local user="$2"
  while true; do
    local msg="${KERNEL_LOGS[$((RANDOM % ${#KERNEL_LOGS[@]}))]}"
    msg="${msg//USER/$user}"
    echo -e "${MAGENTA}[KERNEL]${RESET} $msg"
    sleep 0.2
  done
}

function run_syslog() {
  local user="$2"
  while true; do
    local msg="${SYSLOGS[$((RANDOM % ${#SYSLOGS[@]}))]}"
    msg="${msg//USER/$user}"
    echo -e "${BLUE}[SYSLOG]${RESET} $msg"
    sleep 0.3
  done
}

function run_scans() {
  local user="$2"
  while true; do
    local target="${SCAN_TARGETS[$((RANDOM % ${#SCAN_TARGETS[@]}))]}"
    target="${target//USER/$user}"
    echo -e "${GREEN}Escaneando objetivo $target ...${RESET}"
    sleep 0.3
    for i in {1..3}; do
      local port=$(( (RANDOM % 65535) + 1 ))
      if (( RANDOM % 2 == 0 )); then
        echo -e "${YELLOW}  Puerto $port/tcp [ABIERTO]${RESET}"
      else
        echo -e "${RED}  Puerto $port/tcp [CERRADO]${RESET}"
      fi
      sleep 0.1
    done
    echo
    sleep 1
  done
}

function run_matrix() {
  if command -v cmatrix &>/dev/null; then
    
    cmatrix -b -u 2
  else
    cat /dev/urandom | hexdump -C | grep --line-buffered "[0-9A-F]"
  fi
}

function run_superstuff() {
  local user="$2"
  while true; do
    local msg="${SUPER_STUFF[$((RANDOM % ${#SUPER_STUFF[@]}))]}"
    msg="${msg//USER/$user}"
    echo -e "${CYAN}[HACKER] ${msg}${RESET}"
    sleep $(( (RANDOM % 3) + 1 ))
  done
}


case "$1" in
  kernel)
    run_kernel "$@"
    ;;
  syslog)
    run_syslog "$@"
    ;;
  scans)
    run_scans "$@"
    ;;
  matrix)
    run_matrix "$@"
    ;;
  superstuff)
    run_superstuff "$@"
    ;;
  "")
    clear
    
    show_banner
    type_text "Bienvenido Script kiddie :P"
    type_text "Preparando la sesión de Cupsole..."
    echo

    read -p "Introduce el username o email de la víctima: " HACKUSER
    echo -e "${YELLOW}Iniciando sesión tmux en 5 paneles con el objetivo '${HACKUSER}'...${RESET}"
    sleep 1

    tmux new-session -d -s hackprank "bash $0 kernel '$HACKUSER'"
    tmux split-window -h "bash $0 syslog '$HACKUSER'"
    tmux select-pane -t 0
    tmux split-window -v "bash $0 scans '$HACKUSER'"
    tmux select-pane -t 1
    tmux split-window -v "bash $0 matrix '$HACKUSER'"
    tmux split-window -v "bash $0 superstuff '$HACKUSER'"
    tmux select-layout tiled
    tmux attach-session -t hackprank
    ;;
  *)
    echo "Uso: $0 [kernel|syslog|scans|matrix|superstuff]"
    exit 1
    ;;
esac
