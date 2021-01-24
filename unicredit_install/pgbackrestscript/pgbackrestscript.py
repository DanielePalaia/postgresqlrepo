import subprocess
import datetime
import os


# run the command to check if it's a slave
out = subprocess.Popen(['psql', '-c', 'select pg_is_in_recovery();'],
           stdout=subprocess.PIPE,
           stderr=subprocess.STDOUT)

stdout,stderr = out.communicate()

# if it's a master we can run the backup otherwise we will never run it
stdout_str = str(stdout)
print(stdout_str)

cond_true = "t"
if cond_true not in stdout_str:

	# check if is a newly promoted master, if yes we need to run a full backup
	out = subprocess.Popen(['pgbackrest', 'info'],stdout=subprocess.PIPE,stderr=subprocess.STDOUT)
	stdout,stderr = out.communicate()
	stdout_string = str(stdout)
	print (stdout_string)

	# take timestamp when last backup was started
	index = -1
	try:
        	index = stdout_string.index("stop:")
	except ValueError:
		print("this is the very first backup I will do a full backup")
		os.system('pgbackrest --stanza=unicredit --type=full backup')
		exit(0)

	print ("index is: " + str(index))	
	timestamp = stdout_string[index+6:index+25]
	print ("timestamp is" + " " + timestamp)

        # check the time, if is after 00:00 we run the fist full backup
	now = datetime.datetime.now()
	print (now)
	timestamp_date = datetime.datetime.strptime(timestamp, '%Y-%m-%d %H:%M:%S')
	elapsed_time = now - timestamp_date
	elapsed_time_hours = (elapsed_time.days * 24) + (elapsed_time.seconds / 3600)

	print ("elapsed time in hours:" + str(elapsed_time_hours))

	# newly promoted master I need to doa full backup first
	if (elapsed_time_hours >= 4):
                print("I'm a newly promoted backup")
		os.system('pgbackrest --stanza=unicredit --type=full backup')

	else:
                print("I'm not a newly promoted backup")
		# not a newly promoted backup it depends on the time
		print ("hour of the day is:" + now.hour)
		if now.hour == 0:
        		os.system('pgbackrest --stanza=unicredit --type=full backup')
		# else we run the differencial backup
		else:
        		os.system('pgbackrest --stanza=unicredit --type=diff backup')
