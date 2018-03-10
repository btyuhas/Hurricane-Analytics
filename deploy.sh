#ls 09 | sed 's/[^ ]* */09\/&/ig';
#ls 10 | sed 's/[^ ]* */10\/&/g';
file="folderlist"
lines=`cat $file`
for line in $lines; do
	tar -cvf $line.tar $line;
	scp $line.tar root@159.203.101.20:
	name=${line: -2}
	ssh root@159.203.101.20 "./test.sh $name.tar $line"&
	sleep 60
done
