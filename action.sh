#!/system/bin/sh

# --- Configuration ---
PKG="com.tencent.mm"
DATA_ROOT="/data/data/$PKG"
EXT_ROOT="/sdcard/Android/data/$PKG"

# --- Helper Functions ---
print_log() {
    echo "$1"
}

# Function to safely delete and report sub-folders
# Usage: clean_sub "ParentFolder" "SubFolderName" "Description"
clean_sub() {
    local parent="$1"
    local sub="$2"
    local desc="$3"
    local target="$parent/$sub"

    if [ -d "$target" ]; then
        rm -rf "$target"
        # Print: "Deleted Avatar (3b4e...)"
        print_log "Deleted $desc (${parent##*/})" 
    fi
}

# Function to delete exact paths
clean_exact() {
    if [ -e "$1" ]; then
        rm -rf "$1"
        print_log "Deleted: ${1##*/}" # Prints just the folder name
    fi
}

# --- Start ---

print_log "============================="
print_log "          MMCLEANER          "
print_log "============================="

# 1. Force Stop
print_log "[*] Force stopping $PKG..."
am force-stop $PKG >/dev/null 2>&1

# 2. System Clean (Exact Paths)
print_log "--- Cleaning System Junk ---"
clean_exact "$DATA_ROOT/MicroMsg/CheckResUpdate"
clean_exact "$DATA_ROOT/MicroMsg/emoji"
clean_exact "$DATA_ROOT/MicroMsg/appbrand"
clean_exact "$DATA_ROOT/MicroMsg/pay_palm_print_resource"
clean_exact "$DATA_ROOT/MicroMsg/regioncode"
clean_exact "$DATA_ROOT/MicroMsg/SQLTrace"
clean_exact "$DATA_ROOT/MicroMsg/cdownload"
clean_exact "$DATA_ROOT/app_xweb_data"
clean_exact "$DATA_ROOT/files/public"
clean_exact "$DATA_ROOT/cache"
clean_exact "$DATA_ROOT/face_detect"
clean_exact "$DATA_ROOT/MicroMsg/luckymoney"
clean_exact "$DATA_ROOT/MicroMsg/luckymoneynewyear"
clean_exact "$DATA_ROOT/MicroMsg/flutter"
clean_exact "$DATA_ROOT/MicroMsg/AFFUDRPath"
clean_exact "$DATA_ROOT/MicroMsg/newmsgringtone"
clean_exact "$DATA_ROOT/MicroMsg/scan_passport_model"
clean_exact "$DATA_ROOT/files"

# 3. SD Card Clean (Exact Paths)
print_log "--- Cleaning SD Junk ---"
clean_exact "$EXT_ROOT/cache"
clean_exact "$EXT_ROOT/MicroMsg/appbrand"
clean_exact "$EXT_ROOT/MicroMsg/xlog"
clean_exact "$EXT_ROOT/MicroMsg/crash"

# 4. User Loop (The part you asked for!)
print_log "--- Deep Cleaning Users ---"

# Loop through every folder inside MicroMsg
# We use 'find' to avoid shell expansion limits
for user_path in $(find "$DATA_ROOT/MicroMsg" -maxdepth 1 -mindepth 1 -type d); do
    # Only clean if it looks like a user hash (32 chars), or just clean everything to be safe.
    # The clean_sub function checks if the subfolder exists, so it's safe to run on all.
    
    clean_sub "$user_path" "avatar" "Avatar"
    clean_sub "$user_path" "emoji" "Emoji"
    clean_sub "$user_path" "luckymoney" "LuckyMoney"
    clean_sub "$user_path" "card" "Cards"
    clean_sub "$user_path" "image2" "Thumbnails"
done

# 5. External User Loop (SD Card)
for user_path in $(find "$EXT_ROOT/MicroMsg" -maxdepth 1 -mindepth 1 -type d); do
    clean_sub "$user_path" "avatar" "SD Avatar"
    clean_sub "$user_path" "image2" "SD Thumbnails"
    clean_sub "$user_path" "xlog" "SD Logs"
done

# 6. Lib Clean (Radical)
print_log "--- Cleaning Libs ---"
# Finds any folder starting with "lib-" inside data root
find "$DATA_ROOT" -maxdepth 1 -name "lib-*" -type d 2>/dev/null | while read f; do
    rm -rf "$f"
    print_log "Deleted Lib: ${f##*/}"
done

# 7. App Data Clean (Radical)
print_log "--- Cleaning App Data ---"
# Finds any folder starting with "app" inside data root
find "$DATA_ROOT" -maxdepth 1 -name "app*" -type d 2>/dev/null | while read f; do
    rm -rf "$f"
    print_log "Deleted App Data: ${f##*/}"
done


print_log "============================="
print_log "      CLEANING COMPLETE      "
print_log "============================="

# Keep window open for 2 seconds so you can read the log
sleep 2