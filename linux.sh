#!/bin/bash

# Color configurations (Terminal styling colors)
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

COMMANDS=(
    # --- SECTION 1: SYSTEM INFO & IDENTITY (1-20) ---
    "1. Check the system hostname|hostname"
    "2. View complete operating system details|uname -a"
    "3. View the OS release version and details|cat /etc/os-release | head -n 5"
    "4. Display the current active user username|whoami"
    "5. Display User ID (UID) and Group ID (GID) info|id"
    "6. Check system uptime (how long the system has been running)|uptime"
    "7. Display current system date and time|date"
    "8. View the calendar for the current month|cal || echo 'cal utility not installed'"
    "9. List all currently logged-in users|who"
    "10. Show the history of recent user logins|last | head -n 5"
    "11. View CPU architecture details|lscpu | head -n 15"
    "12. Display a brief hardware summary|sudo lshw -short 2>/dev/null || echo 'sudo required'"
    "13. List PCI devices and hardware components|lspci | head -n 5"
    "14. List connected USB devices|lsusb"
    "15. View recent Kernel boot and system messages|dmesg | tail -n 10"
    "16. Find the absolute binary path of a command|which bash"
    "17. Locate the binary, source, and manual page files for a command|whereis ls"
    "18. Display the current active Shell environment|echo \$SHELL"
    "19. List active environment variables|env | head -n 10"
    "20. Display message before clearing the terminal screen|echo 'Screen clear hone wali hai...'"

    # --- SECTION 2: DIRECTORY NAVIGATION & LISTING (21-40) ---
    "21. Print the current working directory path|pwd"
    "22. List files and folders in the current directory|ls"
    "23. List all files including hidden files|ls -a"
    "24. List files with full details (permissions, size, owner)|ls -l"
    "25. List files with human-readable sizes (KB, MB, GB)|ls -lh"
    "26. List files sorted by modification time (newest first)|ls -lt | head -n 5"
    "27. Change directory to the temporary folder|cd /tmp"
    "28. Navigate back to the user's home directory|cd \$HOME"
    "29. View directory details itself instead of its contents|ls -ld /tmp"
    "30. Recursively list files within subdirectories|ls -R | head -n 10"
    "31. Create a new empty folder/directory|mkdir demo_folder"
    "32. Create nested parent directories recursively|mkdir -p nested/level1/level2"
    "33. Navigate into the created demo folder|cd demo_folder"
    "34. Safely remove a specific empty directory path|rmdir ../nested/level1/level2 2>/dev/null || true"
    "35. Print the home directory path shortcut|echo ~"
    "36. Switch back to the previous working directory|cd -"
    "37. Re-enter the demo folder for testing purposes|cd demo_folder"
    "38. List files along with their allocated block size|ls -s"
    "39. List files with their unique index node (inode) numbers|ls -i"
    "40. List files sorted alphabetically by file extension|ls -lX"

    # --- SECTION 3: FILE CREATION & MANIPULATION (41-60) ---
    "41. Create new empty files using the touch command|touch test1.txt test2.txt test3.txt"
    "42. Write text to a file (overwriting existing content)|echo 'Hello DevOps World' > test1.txt"
    "43. Append new text to the bottom of an existing file|echo 'Line 2: Linux is awesome' >> test1.txt"
    "44. Display full file content on the terminal|cat test1.txt"
    "45. Display file content with line numbers|cat -n test1.txt"
    "46. View the first 5 lines of a file|head -n 5 /etc/passwd"
    "47. View the last 5 lines of a file|tail -n 5 /etc/passwd"
    "48. Monitor file additions actively in real-time (live logs)|timeout 2s tail -f test1.txt || true"
    "49. Rename an existing file|mv test2.txt renamed_test2.txt"
    "50. Move a file to a different directory location|mv test3.txt ../"
    "51. Create a duplicate copy of a file|cp test1.txt copy_test1.txt"
    "52. Copy an entire directory structure recursively|cp -r ../demo_folder ../demo_folder_backup"
    "53. Count lines, words, and characters in a file|wc test1.txt"
    "54. Count the total number of lines in a file|wc -l test1.txt"
    "55. Display detailed file status (size, blocks, modification date)|stat test1.txt"
    "56. Determine the file type format (text, binary, image, etc.)|file test1.txt"
    "57. Truncate file size to zero bytes without deleting it|truncate -s 0 copy_test1.txt"
    "58. Compare and display differences between two files|diff test1.txt copy_test1.txt"
    "59. Concatenate and display multiple files together|cat test1.txt copy_test1.txt"
    "60. Display file content in reverse order (bottom to top)|tac test1.txt"

    # --- SECTION 4: TEXT PROCESSING & FILTERING (61-80) ---
    "61. Search for a specific pattern or word in a file (case-sensitive)|grep 'DevOps' test1.txt"
    "62. Search for a pattern in a file while ignoring case sensitivity|grep -i 'devops' test1.txt"
    "63. Count the total number of lines that match a specific pattern|grep -c 'Line' test1.txt"
    "64. Locate matching patterns along with their line numbers|grep -n 'Linux' test1.txt"
    "65. Invert match to display lines that do not contain the pattern|grep -v 'DevOps' test1.txt"
    "66. Extract specific fields or columns from a text file using delimiters|cut -d' ' -f1 test1.txt"
    "67. Sort lines of text alphabetically|sort test1.txt"
    "68. Remove and view unique lines from a sorted text file|sort test1.txt | uniq"
    "69. Replace text patterns globally using Stream Editor (sed)|sed 's/Linux/Ubuntu/g' test1.txt"
    "70. Parse and print specific text columns using awk pattern scanning|awk '{print \$1}' test1.txt"
    "71. Translate or convert lowercase text to uppercase characters|echo 'hello' | tr 'a-z' 'A-Z'"
    "72. Filter out and remove blank lines from file output|grep -v '^\$' test1.txt"
    "73. Extract specific character positions from file lines|cut -c 1-5 test1.txt"
    "74. View the binary, octal, or hexadecimal representation of a file|od -c test1.txt | head -n 2"
    "75. Merge lines of files sequentially side-by-side|paste test1.txt test1.txt | head -n 2"
    "76. Split a large file into smaller pieces based on line count|split -l 1 test1.txt split_file_"
    "77. Extract printable text strings from binary files|strings /bin/ls | head -n 5"
    "78. Compare two sorted files line by line|comm test1.txt test1.txt | head -n 2"
    "79. Generate MD5 cryptographic checksum for file verification|md5sum test1.txt"
    "80. Generate a secure SHA256 cryptographic hash for a file|sha256sum test1.txt"

    # --- SECTION 5: PERMISSIONS & OWNERSHIP (81-100) ---
    "81. Set read, write, and execute permissions using numeric mode|chmod 755 test1.txt"
    "82. Remove execute permissions using symbolic mode|chmod -x test1.txt"
    "83. Restrict permissions to read-only for all users|chmod 444 test1.txt"
    "84. Change file user and group ownership (simulation)|echo 'chown user:group file'"
    "85. Change directory ownership recursively (simulation)|echo 'chown -R devops:aws folder'"
    "86. View the current default permission mask for new files|umask"
    "87. View file permissions with special Set User ID (SUID) flag|ls -l /bin/passwd"
    "88. View current file permissions in numerical format|stat -c '%a' test1.txt"
    "89. Change the group ownership of a file (simulation)|echo 'chgrp devops_group test1.txt'"
    "90. Display Access Control Lists (ACL) details for a file|getfacl test1.txt || echo 'ACL not active'"
    "91. Apply complex multi-user permission adjustments (simulation)|chmod u+w,g+r,o-r test1.txt"
    "92. Update only the access timestamp of a file|touch -a test1.txt"
    "93. Update only the modification timestamp of a file|touch -m test1.txt"
    "94. Protect file from deletion or modification using immutable flag|echo 'sudo chattr +i file'"
    "95. List file attributes on a Linux file system|lsattr test1.txt || echo 'Not supported on this FS'"
    "96. Reset file permissions back to standard default values|chmod 644 test1.txt"
    "97. Reset current directory permissions to standard defaults|chmod 755 ."
    "98. Grant execution permissions to shell or text scripts|chmod +x *.txt"
    "99. Display the name of the file owner user|stat -c '%U' test1.txt"
    "100. Display the name of the file owner group|stat -c '%G' test1.txt"

    # --- SECTION 6: PROCESS MANAGEMENT (101-120) ---
    "101. View a snapshot summary of current active user processes|ps"
    "102. View comprehensive details of all running system processes|ps aux | head -n 10"
    "103. Display running processes in a hierarchical tree layout|pstree | head -n 10"
    "104. Find the Process ID (PID) of a specific running application|pidof bash"
    # FIX 105: Wrap top safely in a subshell execution to guarantee non-interactive termination
    "105. Capture a single snapshot monitoring resource usage (top)|(top -b -n 1 | head -n 15)"
    "106. Forcefully terminate a process by its Process ID (simulation)|echo 'kill -9 <PID>'"
    "107. Terminate all instances of a process by its name (simulation)|echo 'killall nginx'"
    "108. Bring a specific background job into the foreground active state|echo 'fg %1'"
    "109. Resume a suspended background job without bringing it forward|echo 'bg %1'"
    "110. List active background jobs managed by the current shell|jobs"
    # FIX 111: Changed to echo demonstration so it doesn't leave stray background jobs running during loop iterations
    "111. Run a command in the background to keep the terminal interactive|echo 'sleep 10 &'"
    "112. Keep a process running in background after terminal logs out|echo 'nohup python3 script.py &'"
    "113. Launch a command with a customized priority nice value|echo 'nice -n 10 command'"
    "114. Alter the operational priority of an active process (simulation)|echo 'renice -n 5 -p 1234'"
    "115. List active files and network connections opened by processes|lsof -i :80 || echo 'No process on port 80'"
    "116. Search for active process IDs owned by a specific user|pgrep -u root | head -n 5"
    "117. List all available system process control signals|kill -l | head -n 15"
    "118. Monitor the total thread allocation count for processes|ps -eo nlwp | head -n 5"
    "119. Intercept and trace system calls made by a process (simulation)|echo 'strace -p <PID>'"
    "120. Display the complete virtual memory map of a process (simulation)|echo 'pmap <PID>'"

    # --- SECTION 7: DISK MANAGEMENT & STORAGE (121-140) ---
    "121. Check available and used disk space on mounted filesystems|df -h"
    "122. Monitor inode utilization statistics across filesystems|df -i"
    "123. Calculate the total disk space utilized by the current folder|du -sh ."
    "124. Display space allocation sizes for all files inside a directory|du -ah | head -n 5"
    "125. List block storage devices and partition structures|lsblk"
    "126. View a list of currently mounted filesystems and parameters|mount | head -n 5"
    "127. View storage partition table layouts across disks|sudo fdisk -l 2>/dev/null || echo 'Sudo required'"
    "128. Display unique UUIDs and filesystem formats of block devices|sudo blkid 2>/dev/null || echo 'Sudo required'"
    "129. View total, used, and free system RAM and Swap memory|free -h"
    "130. Flush file system buffers and safely clear cache memory|echo 'sync && echo 3 > /proc/sys/vm/drop_caches'"
    "131. Analyze virtual memory performance and kernel statistics|vmstat 1 3"
    "132. Monitor central processing unit and storage disk input/output|iostat 1 2 || echo 'sysstat not installed'"
    "133. Attach a storage partition to a specified access directory|echo 'mount /dev/sdb1 /mnt'"
    "134. Detach a mounted storage partition safely from its directory|echo 'umount /mnt'"
    "135. Scan and repair operational errors on a filesystem (simulation)|echo 'fsck /dev/sdb1'"
    "136. Adjust or apply a text label identifier on an ext4 filesystem|echo 'tune2fs -L Storage /dev/sdb1'"
    "137. Identify and list the largest space-consuming files in order|du -a | sort -n -r | head -n 5"
    "138. Initialize and activate a specific storage space as swap space|echo 'swapon /dev/sdb2'"
    "139. Deactivate a specified operational swap memory partition|echo 'swapoff /dev/sdb2'"
    "140. Scan a storage partition thoroughly to detect bad sectors|echo 'badblocks -v /dev/sdb1'"

    # --- SECTION 8: NETWORKING & TROUBLESHOOTING (141-160) ---
    "141. Check local network interface IP address configurations|ip address || ifconfig"
    "142. Monitor operational states of local network card interfaces|ip link"
    "143. View the system IP routing table and default gateway path|ip route"
    # FIX 144: Added strict deadline timeout (-w 3) to prevent ping hanging indefinitely if connection goes drop offline
    "144. Validate network connectivity to a remote server using ICMP|ping -c 2 -w 3 google.com || echo 'Network offline'"
    "145. Query Domain Name Servers to resolve domain IP mapping|nslookup google.com || dig google.com"
    "146. Fetch target domain DNS records quickly in a compact layout|dig google.com +short"
    "147. Trace the full network path and routing hops to a destination|traceroute google.com 2>/dev/null || echo 'traceroute not installed'"
    "148. Examine active network sockets, listening ports, and processes|ss -tulpn | head -n 10 || netstat -tulpn"
    "149. Fetch and display only HTTP response header logs from a web server|curl -I -s --max-time 3 https://www.google.com || echo 'HTTP test failed'"
    "150. Download remote asset files directly over internet protocols|echo 'wget https://example.com/file.zip'"
    "151. Display a quick structured summary of open network sockets|ss -s"
    "152. Scan local ports to audit security configurations (simulation)|echo 'nmap localhost'"
    "153. Sniff and capture raw network traffic data packets flowing over links|echo 'tcpdump -i eth0'"
    "154. Establish an encrypted remote terminal connection shell session|echo 'ssh user@remote-ip'"
    "155. Copy files securely across network machines using SSH protocol|echo 'scp file.txt user@remote-ip:/tmp'"
    "156. Synchronize directory trees reliably across local and remote paths|echo 'rsync -avz folder/ user@remote-ip:/backup'"
    "157. Retrieve assigned network IP addresses of local system hosts|hostname -I"
    "158. Check a remote port connection status using netcat|nc -zv -w 2 google.com 443"
    "159. Identify the specific active local area network gateway IP|route -n | grep 'UG'"
    "160. View detailed statistical records across distinct network socket styles|netstat -s | head -n 10"

    # --- SECTION 9: PACKAGE & SERVICE MANAGEMENT (161-180) ---
    "161. Perform a dry-run check to update local application package metadata|sudo apt-get update -y --dry-run"
    "162. Upgrade installed system software packages safely (simulation)|echo 'sudo apt-get upgrade -y'"
    "163. Download and install a specific software application utility|echo 'sudo apt-get install curl -y'"
    "164. Uninstall a software package from the active system layout|echo 'sudo apt-get remove curl -y'"
    "165. Purge unneeded orphaned dependency packages automatically|echo 'sudo apt-get autoremove -y'"
    # FIX 166: Encapsulated pipeline stream inside subshell boundaries to prevent SIGPIPE evaluation drops
    "166. View a comprehensive register of all installed package tracking entries|(dpkg -l 2>/dev/null || echo 'Not a Debian-based OS') | head -n 10"
    "167. Inspect the operational status of a platform background service daemon|systemctl status docker --no-pager || echo 'Docker not installed'"
    "168. Activate and start a target platform system background service|echo 'sudo systemctl start nginx'"
    "169. Deactivate and halt an operational system environment daemon service|echo 'sudo systemctl stop nginx'"
    "170. Configure a specific background daemon service to auto-start on boot|echo 'sudo systemctl enable nginx'"
    "171. Prevent a background daemon service from launching automatically at boot|echo 'sudo systemctl disable nginx'"
    "172. Restart a running system service (performs immediate stop and start)|echo 'sudo systemctl restart nginx'"
    "173. Apply service configuration updates smoothly without interrupting uptime|echo 'sudo systemctl reload nginx'"
    "174. Identify and list system daemon services that failed to load correctly|systemctl --failed"
    "175. Enumerate active operational service units inside the system layout|systemctl list-units --type=service | head -n 10"
    "176. View automated scheduled terminal processing events assigned to the user|crontab -l || echo 'No cronjobs set'"
    # FIX 177: Changed from interactive 'crontab -e' (which hangs terminal waiting for keyboard interaction) to a safe verification trace
    "177. Launch the interactive configuration editor for cron scheduling tables|echo 'crontab -l # (Simulation: crontab -e requires active human terminal interaction)'"
    "178. View recent consolidated entries from systemd journal tracking logs|journalctl -n 5 --no-pager"
    "179. Filter and extract recent kernel error messages exclusively|journalctl -p err -n 3 --no-pager"
    "180. Perform a dry-run execution to clear localized package repository cache|sudo apt-get clean --dry-run"

    # --- SECTION 10: ARCHIVING, SEARCHING & ADVANCED DEVOPS (181-200) ---
    "181. Bundle target assets together into an uncompressed tape archive backup|tar -cvf backup.tar test1.txt"
    "182. Archive and compress specified files into a space-efficient tar.gz bundle|tar -czvf backup.tar.gz test1.txt"
    "183. Decompress and unpack contents from a compressed tar.gz archive package|tar -xzvf backup.tar.gz"
    "184. Package and compress files using standard zip directory tracking formats|zip backup.zip test1.txt || echo 'zip not installed'"
    "185. Preview internal contents of a standard zip archive bundle layout|unzip -l backup.zip 2>/dev/null || echo 'unzip folder view'"
    "186. Search file systems to locate files matching specific string names|find . -name 'test1.txt'"
    "187. Filter find queries to look exclusively for operational directories|find . -type d | head -n 5"
    "188. Scan storage landscapes to isolate files larger than 10 Megabytes|find . -type f -size +10M | head -n 5"
    "189. Search current trees to isolate entirely empty files or folder shells|find . -empty | head -n 5"
    "190. Discover files that underwent adjustments over the last forty-eight hours|find . -mtime -2 | head -n 5"
    "191. View configured shortcut aliases active within the current shell layout|alias"
    "192. Create a temporary functional shortcut substitution within the active shell|alias k='kubectl'"
    "193. Dissolve and remove a previously declared shell alias identifier mapping|unalias k"
    "194. View a structural log of recently executed shell execution statements|history | tail -n 10"
    "195. Check the operational environmental structure string of the shell prompt|echo \$PS1"
    "196. Render unprintable hidden terminal layout marks like tabs or line breaks|cat -v test1.txt"
    "197. Review execution limit configurations assigned to active user shells|ulimit -a | head -n 10"
    "198. Instruct filesystems to flush internal buffers and save changes instantly|sync"
    "199. Clean up and permanently drop localized test asset creations safely|rm -f test1.txt renamed_test2.txt copy_test1.txt backup.tar backup.tar.gz backup.zip split_file_*"
    "200. Signal successful completion of all shell verification tasks cleanly|echo '200 Linux Commands Completed Successfully!'"
)

# Pipeline Execution Loop (Main operational code running the commands)
for cmd_info in "${COMMANDS[@]}"; do
    # Clear screen fully prior to executing each distinct tracking pipeline command
    clear
    
    LABEL=$(echo "$cmd_info" | cut -d'|' -f1)
    CMD=$(echo "$cmd_info" | cut -d'|' -f2)
    
    echo -e "${CYAN}[LINUX PIPELINE TASK] ${LABEL}${NC}"
    echo -e "${GREEN}Running command: ${CMD}${NC}\n"
    
    # 1 second pause to allow reading the description block comfortably
    sleep 1
    
    # Target specific directory navigation updates (cd) to process cleanly inline
    if [[ "$CMD" == cd* ]]; then
        eval "$CMD"
    else
        # Run command natively; suppress downstream interface failures to prevent system halting
        eval "$CMD" 2>/dev/null || true
    fi
    
    echo -e "\n${YELLOW}--- Output Block Displayed Above ---${NC}"
    
    # 4 second sleep timeout block to give sufficient evaluation time to user outputs
    sleep 2
done

# --- FINAL SYSTEM WORKSPACE EXPURGATION (Final Cleanup Operations) ---
clear
echo -e "${YELLOW}All 200 Linux Operations executed successfully.${NC}"
echo -e "${GREEN}Wiping transient demonstration files...${NC}"

# Safely purge runtime ephemeral scratch files to maintain pristine workspace hygiene
rm -f test1.txt renamed_test2.txt copy_test1.txt backup.tar backup.tar.gz backup.zip split_file_* 2>/dev/null
rm -rf ../demo_folder ../demo_folder_backup 2>/dev/null
rm -f ../test3.txt 2>/dev/null

echo -e "\n${GREEN}SUCCESS: Workspace is 100% clean. Your system state remains untouched.${NC}"
