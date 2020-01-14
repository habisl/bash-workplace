### Bash Script for practice
Reharsing stuff: 
https://www.youtube.com/watch?v=oxuRxtrO2Ag

#### Useful Links
1. Using Shell Scripting to Automate Linux System Maintenance: 

https://www.tecmint.com/using-shell-script-to-automate-linux-system-maintenance-tasks/

https://ryanstutorials.net/bash-scripting-tutorial/bash-script.php

#### Quick guide 
$0 - The name of the Bash script.

$1 - $9 - The first 9 arguments to the Bash script. (As mentioned above.)

$# - How many arguments were passed to the Bash script.

$@ - All the arguments supplied to the Bash script.

$? - The exit status of the most recently run process

$$ - The process ID of the current script.

$USER - The username of the user running the script.

$HOSTNAME - The hostname of the machine the script is running on.

$SECONDS - The number of seconds since the script was started.

$RANDOM - Returns a different random number each time is it referred to.

$LINENO - Returns the current line number in the Bash script.


$1, $2, ...The first, second, etc command line arguments to the script.

variable=value To set a value for a variable. Remember, no spaces on either side of =

Quotes " ' Double will do variable substitution, single will not.

variable=$( command ) Save the output of a command into a variable

export var1 Make the variable var1 available to child processes.

#### Operator	Description

! EXPRESSION	The EXPRESSION is false.

-n STRING	The length of STRING is greater than zero.

-z STRING	The lengh of STRING is zero (ie it is empty).

STRING1 = STRING2	STRING1 is equal to STRING2

STRING1 != STRING2	STRING1 is not equal to STRING2

INTEGER1 -eq INTEGER2	INTEGER1 is numerically equal to INTEGER2

INTEGER1 -gt INTEGER2	INTEGER1 is numerically greater than INTEGER2

INTEGER1 -lt INTEGER2	INTEGER1 is numerically less than INTEGER2

-d FILE	FILE exists and is a directory.

-e FILE	FILE exists.

-r FILE	FILE exists and the read permission is granted.

-s FILE	FILE exists and it's size is greater than zero (ie. it is not empty).

-w FILE	FILE exists and the write permission is granted.

-x FILE	FILE exists and the execute permission is granted.


There are several conditional expressions that could be used to test with the files. Following are few conditional expressions that are helpful.

[ -e filepath ] Returns true if file exists.
[ -x filepath ] Returns true if file exists and executable.
[ -S filepath ] Returns true if file exists and its a socket file.
[ expr1 -a expr2 ] Returns true if both the expression is true.
[ expr1 -o expr2 ] Returns true if either of the expression1 or 2 is true.
