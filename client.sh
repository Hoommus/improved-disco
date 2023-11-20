
# try to connect indefinitely just in case 
while true 
do
	# This opens STDIN in the console for typing
	# On the other side server will write this to netcat.log, which would
	# appear in the working directory
	nc server 7777

	# Or just connect and send one single line
	# echo "hello from the other side, I'm rollin' in the deep" | nc server 7777
	sleep 1
done

