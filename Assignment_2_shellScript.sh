Assignment 2 :
 
Write a bash/python script that takes list of hostnames (comma separated) as an argument.
This script, when executed, should connect to all the servers via. SSH (standard port) (assume 

password-less connectivity) and give a single prompt to the user.
When the user executes a command on this prompt, the script should run the command on all 

connected servers and display the output.
Make this as efficient as possible, code comments appreciated.


Solution:

	I execute script like : script.sh host1,host2,host3,host4
like passing four hostnames in command line argument and giving command 'uname -n', o/p will 

be:

Output: 
	There are 4 hosts, as arg.sh: host1 host2 host3 host4
	Enter command/s:
	uname -n
	Your command is ---> uname -n
	Hostname : host1
	host1.domain.com
	Hostname : host2
	host2.domain.com
	Hostname : host3
	host3.domain.com
	Hostname : host4
	host4.domain.com


Script: 

  1 #!/bin/bash
  2          ## Changing delimiter of arguments(hostnames) from space(Default) to comma.
  3 IFS=',' ; set -- $*
  4         ## Listing arguments(hostnames) from command line.
  5 echo There are $# hosts in $0: $*
  6         ##Reading command/s from user input.
  7 read -p "Enter command/s:" cmd
  8 echo "Your command is ---> $cmd"
  9        ## Starting loop, taking hostname one at time from arguments.
 10 for i in "$@"
 11 do
 12 echo "Hostname : $i"
 13         ## Logging as root(assuming password-less connectivity) and execute command/s 	

    entered by user in script
 14 ssh root@$i "$cmd"
 15 done
