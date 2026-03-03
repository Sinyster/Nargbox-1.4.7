#!/bin/bash

SOURCE_DIR="/home/rpi/server/minecraft/nargbox-1_4_7/Server"
DEST_USER="sinyster"
DEST_IP="192.168.1.110"
DEST_DIR="/home/sinyster/server/minecraft/backups/nargbox"
ARCHIVE_NAME="backup_$(date +%Y%m%d).tar.gz"

# --- KONTROLA ZÁVISLOSTÍ ---
if ! command -v pv &> /dev/null; then
    echo "Nástroj 'pv' není nainstalován. Instaluji (vyžaduje sudo)..."
    sudo apt update && sudo apt install -y pv || { echo "Instalace selhala. Nainstalujte 'pv' ručně."; exit 1; }
fi

# 1. ZÍSKÁNÍ VELIKOSTI (pro progress bar)
echo "Počítám velikost složky..."
SIZE=$(du -sb "$SOURCE_DIR" | awk '{print $1}')

# 2. KOMPRESE S PROGRESS BAREM
echo "Komprimuji složku: $SOURCE_DIR"
# tar vytvoří stream -> pv ukáže progress -> gzip to zabalí do souboru
tar -cf - -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")" \
    | pv -s "$SIZE" \
    | gzip > "$ARCHIVE_NAME"

echo -e "\nKomprese dokončena: $ARCHIVE_NAME"

# 3. PŘENOS NA SERVER
echo "Odesílám na server $DEST_IP..."
# scp nativně ukazuje progress bar pro přenos souboru
scp "$ARCHIVE_NAME" "$DEST_USER@$DEST_IP:$DEST_DIR"

# 4. ÚKLID A KONTROLA
if [ $? -eq 0 ]; then
    echo "------------------------------------------"
    echo "ÚSPĚCH: Soubor byl přenesen."
    # Pokud chcete lokální soubor po přenosu smazat, odkomentujte řádek níže:
    rm "$ARCHIVE_NAME"
else
    echo "------------------------------------------"
    echo "CHYBA: Přenos se nezdařil."
    exit 1
fi

