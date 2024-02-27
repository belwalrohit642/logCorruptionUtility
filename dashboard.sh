# dashboard() {
#     echo "============================================================================================================================="
#     printf "%-35s | %-40s | %-35s\n" "Name" "Status" "Corrupt"
#     echo "============================================================================================================================="

#     for file in /home/rohit/Documents/task2/revision2/proc/info/*; do
#         name=$(basename "$file")
#         Name=$(echo "$name" | cut -d "_" -f 2,3,4)
#         read -r status message < "$file"
#         printf "%-35s | %-40s | %-35s\n" "$Name" "$status" "$message"
#     done
# }
        
# while true; do
#     tput cup 0 0
#     output=$(dashboard)
#     echo "$output"
# done
dashboard() {
    echo "======================================================================================================="
    printf "\033[1;34m%-30s\033[0m | \033[1;32m%-35s\033[0m | \033[1;33m%-25s\033[0m\n" "System" "Status" "Details"
    echo "======================================================================================================="

    for file in /home/rohit/Documents/task2/revision2/proc/info/*; do
        name=$(basename "$file")
        SystemName=$(echo "$name" | cut -d "_" -f 2,3,4)
        read -r sys_status sys_message < "$file"
        printf "\033[1;34m%-30s\033[0m | \033[1;32m%-35s\033[0m | \033[1;33m%-25s\033[0m\n" "$SystemName" "$sys_status" "$sys_message"
    done
}

while true; do
    tput cup 0 0
    output=$(dashboard)
    echo "$output"
    sleep 5  # Add a sleep to avoid constant updates and make it visually distinct
done
