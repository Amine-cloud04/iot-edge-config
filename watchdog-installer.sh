#!/bin/bash

set -e

echo "Mise à jour des paquets..."
apt update && apt upgrade -y

echo "Installation de watchdog..."
apt install -y watchdog

echo "Création du script de vérification de l'espace disque..."
cat << 'EOF' > /usr/local/bin/check_disk.sh
#!/bin/bash
usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ "$usage" -gt 90 ]; then
  echo "Espace disque faible: ${usage}% utilisé"
  exit 1
else
  echo "Espace disque OK: ${usage}% utilisé"
  exit 0
fi
EOF

chmod +x /usr/local/bin/check_disk.sh

echo "Configuration de watchdog..."
cat << EOF > /etc/watchdog.conf
watchdog-device = /dev/watchdog
interval = 15
max-load-1 = 10
min-memory = 100
test-binary = /usr/local/bin/check_disk.sh
file = /tmp
change = 1407
logtick = 5
realtime = yes
priority = 1
EOF

echo "Activation et démarrage du service watchdog..."
systemctl enable watchdog
systemctl restart watchdog

echo "Script terminé. Watchdog est installé, configuré et lancé."
