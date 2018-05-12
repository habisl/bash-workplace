# Make a script that generates a system report
# Make a small summary of system information
# Print the result to the screen and write the information to a file

#!/bin/bash
freespace=$(df -h / | grep -E "\/$" | awk '{print $4}')
