#!/bin/bash

# User Management Tool with Banner
# Author: Sutharsan Senthil
# Date: 2025-08-19

LOG_FILE="user_management.log"

# Check if run as root
if [ "$EUID" -ne 0 ]; then
  echo "[!]==> Please run as root or with sudo"
  exit 1
fi

# Function: Show Banner
show_banner() {
    clear
    figlet "// User Management Tool //"
    echo "==========================================="
    echo "   Linux User Administration Tool"
    echo "   Author: SUTHARSAN"
    echo "==========================================="
    echo
}

# Function: Create User
create_user() {
    read -p "[*]==> Enter the new username: " username
    if id "$username" &>/dev/null; then
        echo "[!]==> User '$username' already exists."
        return
    fi

    read -s -p "[*]==> Enter password for $username: " password
    echo
    read -s -p "[*]==> Confirm password: " password2
    echo

    if [ "$password" != "$password2" ]; then
        echo "[!]==> Passwords do not match. Try again."
        return
    fi

    useradd -m -s /usr/bin/zsh "$username"
    echo "$username:$password" | chpasswd
    passwd -e "$username"

    echo "[*]==> User $username created successfully on $(date)" | tee -a "$LOG_FILE"
}

# Function: Lock User
lock_user() {
    read -p "[*]==> Enter the username to lock: " username
    if id "$username" &>/dev/null; then
        passwd -l "$username"
        echo "[*]==> User '$username' has been locked." | tee -a "$LOG_FILE"
    else
        echo "[!]==> User '$username' does not exist."
    fi
}

# Function: Unlock User
unlock_user() {
    read -p "[*]==> Enter the username to unlock: " username
    if id "$username" &>/dev/null; then
        passwd -u "$username"
        echo "[*]==> User '$username' has been unlocked." | tee -a "$LOG_FILE"
    else
        echo "[!]==> User '$username' does not exist."
    fi
}

# Function: Delete User
delete_user() {
    read -p "[*]==> Enter the username to delete: " username
    if id "$username" &>/dev/null; then
        userdel -r "$username"
        echo "[*]==> User '$username' has been deleted." | tee -a "$LOG_FILE"
    else
        echo "[!]==> User '$username' does not exist."
    fi
}

# Function: Display All Users
display_users() {
    echo "[*]==> List of users:"
    cut -d: -f1 /etc/passwd
}

# Main Menu Loop
while true; do
    show_banner
    echo "========== User Management =========="
    echo "1. Create a new user"
    echo "2. Lock a user account"
    echo "3. Unlock a user account"
    echo "4. Delete a user account"
    echo "5. Display all users"
    echo "6. Exit"
    echo "====================================="
    read -p "[*]==> Enter your choice [1-6]: " choice

    case $choice in
        1) create_user ;;
        2) lock_user ;;
        3) unlock_user ;;
        4) delete_user ;;
        5) display_users ;;
        6) echo "[*]==> Exiting User Management Tool"; exit 0 ;;
        *) echo "[*]==>  Invalid choice. Please try again." ;;
    esac

    read -p "Press Enter to continue..."
done
