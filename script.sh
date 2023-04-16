set -e
for (( i=10; i>=1; i-- ))
do
	touch a$i.txt
	echo "welcome" > a$i.txt
done
echo "Enter variable 1"
read var1
echo "Enter variable 2"
read var2
if (( $var1 == $var2 ))
then
	tar -cvzf new.tar.gz *
	git add new.tar.gz *
	git commit -m "added new file to master"
	git push origin master
else
	git add .
	git checkout -b develop master
	git commit -m "added new file to develop"
	git push origin develop
fi
