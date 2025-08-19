#  User Management Tool

A **Linux system administration tool** written in **Bash** that allows administrators to manage user accounts directly from the terminal with an interactive menu.  
This project showcases **System Administrator skills** such as user creation, account locking, unlocking, deletion, and password management.  

---

##  Features

- => Create new users (default shell: **Zsh** → Kali-style prompt)  
- => Secure password setup with confirmation  
- => Enforce password change on first login  
- => Lock and unlock user accounts  
- => Delete users (including home directories)  
- => Display all system users  
- => Check password/account status (`passwd -S`)  
- => Logs all operations in `user_management.log`  

---

## 📂 Project Structure


user_management/
│── user_management.sh # Main Bash script
│── user_management.log # Log file (auto-generated after use)
│── README.md # Documentation

---

##  Getting Started

### Clone the repository
```bash
git clone https://github.com/sanmarkos/user_management.git
cd user_management
```
### Make the script executable
```
chmod +x user_management.sh
```
### Run the tool (requires root/sudo privileges)
```
sudo ./user_management.sh
```
## Security Notes

Only root/sudo users can run this script.

New users are created with Zsh shell by default (Kali-style prompt).

Users are forced to change their password at first login.

Logging ensures an audit trail for all actions.

## Demo
<img width="540" height="546" alt="image" src="https://github.com/user-attachments/assets/7aaf9361-15af-457f-bee9-ca5fcd38b872" />

## Learning Outcomes

By building this project, I gained practical knowledge in:

Linux user and permission management

Bash scripting and automation

System security (password expiry & account locking)

Creating menu-driven CLI applications

Logging and monitoring admin actions

## Author
 Sutharsan
 sutharsansenthil46@gmail.com
 GitHub: sanmarkos
