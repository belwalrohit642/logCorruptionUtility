#!/bin/bash
 
# # Check if the number of arguments provided is correct
# if [ "$#" -ne 1 ]; then
#    echo "Usage: $0 <number_of_log_files>"
#    exit 1
# fi
 
# # Function to generate random alphanumeric pattern
# generate_alphanumeric_pattern() {
#    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w "$1" | head -n 1
# }
 
# # Generate log files
# for ((i = 1; i <= $1; i++)); do
#    total_lines=$((10000000 + RANDOM % 10000000))  # Randomize total lines between 10M and 20M
#    repeat_pattern=$((total_lines / 100))          # Set repeat pattern to be a smaller proportion of total lines
 
#    alphanumeric_pattern=$(generate_alphanumeric_pattern $((5 + RANDOM % 10)))
#    log_file_name="${total_lines}_${alphanumeric_pattern}_${repeat_pattern}.log"
#    touch "$log_file_name"
 
#    for ((j = 1; j <= total_lines; j++)); do
#        if [ "$j" -le "$repeat_pattern" ]; then
#            echo "$alphanumeric_pattern" >> "$log_file_name"
#        else
#            echo "$(generate_alphanumeric_pattern $((10 + RANDOM % 20)))" >> /home/rohit/Documents/task2/revision2/remoteServer/"$log_file_name"
#        fi
#    done
 
#    echo "Created $log_file_name"
# done
#!/bin/bash

# Check if the number of arguments provided is correct
if [ "$#" -ne 1 ]; then
   echo "Usage: $0 <number_of_log_files>"
   exit 1
fi

# Function to generate random alphanumeric pattern
generate_alphanumeric_pattern() {
   cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w "$1" | head -n 1
}

# Generate log files
for ((i = 1; i <= $1; i++)); do
   total_lines=$((10000 + RANDOM % 10000))  # Randomize total lines between 1K and 20K
   repeat_pattern=$((total_lines / 100))    # Set repeat pattern to be a smaller proportion of total lines

   alphanumeric_pattern=$(generate_alphanumeric_pattern $((5 + RANDOM % 10)))
   log_file_name="${total_lines}_${alphanumeric_pattern}_${repeat_pattern}.log"
#    touch "$log_file_name"

   for ((j = 1; j <= total_lines; j++)); do
       if [ "$j" -le "$repeat_pattern" ]; then
           echo "$alphanumeric_pattern" >> "$log_file_name"
       else
           echo "$(generate_alphanumeric_pattern $((10 + RANDOM % 20)))" >> /home/rohit/Documents/task2/revision2/remoteServer/"$log_file_name"
       fi
   done

   echo "Created $log_file_name"
done

 